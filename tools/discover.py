#!/usr/bin/env python3
"""Scan the GitHub topics that carry dsh plugins and report what changed.

Three questions, three modes, and they are deliberately separate because each
one wants a different PR and a different amount of human attention:

  --new     repos in the topics that this index does not carry yet
  --bump    carried packages whose upstream has moved past our pinned commit
  --audit   carried packages whose pinned commit is GONE upstream

`--audit` is the one that must never auto-merge. A pinned sha disappearing
means a force push, a history rewrite, or a deleted repo, and following it
silently would turn "this index pins exactly these bytes" into a promise it
stopped keeping without saying so. It reports; a human decides.

It fails only when the vanished version is NOT mirrored. A mirrored one is
already here -- the tarball is in xlings-res under a sha256, so `xlings
install dsh:<pkg>` keeps working and nothing downstream notices. An
un-mirrored one is a pointer at a repo that no longer exists: it promises
bytes nobody can fetch, and the only honest fix is to remove the descriptor.

Topics: `dsh-plugin` is the ecosystem's discovery entry point and where every
package here came from. `dsh-tool` is checked too and is currently empty (0
repos), which is why it is listed rather than assumed -- an empty topic that
nobody notices reads exactly like a working scan.

Requires `gh` authenticated (the workflow supplies GH_TOKEN).

Usage: tools/discover.py --new|--bump|--audit [--json <path>] [--limit N]
"""
from __future__ import annotations

import argparse
import base64
import json
import pathlib
import re
import subprocess
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parent.parent
PKGS = ROOT / "pkgs"

TOPICS = ["dsh-plugin", "dsh-tool"]
# The bar for the UNATTENDED SCAN, and for nothing else. A contributor opening
# a PR for their own package is not filtered by it: nothing in tests/ or the
# descriptor contract reads a star count, and nothing should. This number is a
# triage heuristic for a robot with nobody watching it, not a claim about which
# packages deserve to be in the index -- a human who shows up with a working
# package has already supplied the signal this is a proxy for.
#
# Ten, inclusive -- a repo with exactly ten stars is in. Raised from 2 on
# 2026-08-15: at 2 the first scan under the repaired pipeline proposed 358
# packages in a single PR, because the `dsh-plugin` topic had grown to 800
# repos against the 281 the original survey measured, so a bar calibrated for
# the old size had stopped triaging anything at all.
MIN_STARS = 10


def enough_stars(count) -> bool:
    """Ten is in, nine is out. The bar is inclusive, and a function rather
    than an inline comparison so the boundary is testable at all."""
    return (count or 0) >= MIN_STARS


class GhError(RuntimeError):
    """gh could not answer. Never the same thing as "the answer is no"."""


# What "genuinely not there" looks like on the wire. A deleted or
# renamed-away repository answers 404; a sha that no longer exists inside a
# repository that does answers **422** ("No commit found for SHA"), and that
# is the shape most --audit hits take. Measured against this repo on
# 2026-08-15 -- a fix that trusted 404 alone would have turned every real
# missing pin into a crash instead of a report.
MISSING = {404, 422}


def gh_call(path: str) -> tuple:
    """(parsed body or None, HTTP status; 0 when gh never got one).

    `gh api` writes the error body to stdout and exits non-zero, so the exit
    code is checked before the body is parsed.
    """
    r = subprocess.run(["gh", "api", path], capture_output=True, text=True)
    if r.returncode == 0:
        try:
            return json.loads(r.stdout), 200
        except json.JSONDecodeError:
            return None, 0
    m = re.search(r"\(HTTP (\d{3})\)", r.stderr)
    return None, int(m.group(1)) if m else 0


def gh_json(path: str):
    """The body, or None when the resource genuinely does not exist.

    Everything else raises, and that distinction is the entire point of this
    function. `--audit` reads a None as "this pinned commit is GONE" and fails
    the run -- the loudest thing this repository can say, and per the workflow
    it means a force push, a rewritten history or a deleted repo.

    The previous version returned None for a 403 rate limit, a 5xx and a
    dropped connection as well. One exhausted budget would have reported all
    70 upstreams as force-pushed at once, unattended, at 04:17 -- and the
    budget is not far off: a full scan already costs about 760 calls against a
    1,000/hour ceiling on the fallback token.
    """
    data, status = gh_call(path)
    if status in MISSING:
        return None
    if data is None:
        raise GhError(f"{path}: HTTP {status or 'no response from gh'}")
    return data


def rate_check(need: int, what: str) -> None:
    """Refuse to start a scan that cannot finish.

    Running out halfway is not a partial answer, it is two wrong ones: `--new`
    reports "nothing found" and `--audit` reports "the pin is gone". Reading
    the limit is itself free.
    """
    data, status = gh_call("rate_limit")
    if data is None:
        raise GhError(f"cannot read the rate limit: HTTP {status or 'no response'}")
    core = data["resources"]["core"]
    if core["remaining"] >= need:
        print(f"  budget: {core['remaining']}/{core['limit']} REST calls left, "
              f"{what} needs about {need}", file=sys.stderr)
        return
    wait = max(0, core["reset"] - int(time.time()))
    raise GhError(
        f"{core['remaining']} REST calls left of {core['limit']} and {what} "
        f"needs about {need}. Resets in {wait // 60}m{wait % 60:02d}s. "
        f"Refusing to start: a scan that runs out halfway reports 'nothing "
        f"found' and 'every pin is gone', and both are wrong. A PAT in "
        f"DISCOVER_TOKEN raises this ceiling from 1,000 to 5,000.")


def gh_search(topic: str, limit: int) -> list:
    out, page = [], 1
    while len(out) < limit:
        data = gh_json(f"search/repositories?q=topic:{topic}&per_page=100&page={page}")
        items = (data or {}).get("items") or []
        if not items:
            break
        out += items
        if len(items) < 100:
            break
        page += 1
    return out[:limit]


def file_at(repo: str, ref: str, rel: str):
    data = gh_json(f"repos/{repo}/contents/{rel}?ref={ref}")
    if not data or "content" not in data:
        return None
    try:
        return base64.b64decode(data["content"]).decode("utf-8", "replace")
    except Exception:
        return None


def carried() -> dict:
    """name -> {repo, bundle, commit, version} for every descriptor we have."""
    out = {}
    for path in sorted(PKGS.rglob("*.lua")):
        body = path.read_text(encoding="utf-8")
        block = body[body.index("dsh = {"):]
        kind = re.search(r'kind = "([^"]+)"', block)
        if kind and kind.group(1) != "plugin":
            continue          # groups and Agents have no upstream to track
        repo = re.search(r'repo = "https://github\.com/([^"]+)"', body)
        latest = re.search(r'latest = "([^"]+)"', block)
        if not (repo and latest):
            continue
        bundle = re.search(r'bundle_name = "([^"]+)"', block)
        vblock = re.search(rf'\["{re.escape(latest.group(1))}"\]\s*=\s*'
                           r'\{[^}]*commit = "([0-9a-f]{40})"', block)
        # Whether THIS version's bytes live in xlings-res. That is what decides
        # whether the package survives its upstream disappearing: a mirrored
        # tarball is a copy this index already holds and checksummed, so a
        # deleted repo costs nothing. An un-mirrored one is a pointer, and a
        # pointer to a deleted repo is an empty promise.
        mblock = re.search(r'mirror = \{(.*?)\n        \}', block, re.S)
        mirrored = bool(mblock and f'["{latest.group(1)}"]' in mblock.group(1))
        out[path.stem] = {
            "repo": repo.group(1).rstrip("/"),
            "bundle": bundle.group(1) if bundle else "",
            "version": latest.group(1),
            "commit": vblock.group(1) if vblock else "",
            "mirrored": mirrored,
        }
    return out


def excluded() -> dict:
    p = ROOT / "tools" / "excluded.json"
    return json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}


def mode_new(limit: int) -> list:
    have = carried()
    have_repos = {v["repo"].lower() for v in have.values()}
    have_repos |= {e["repo"].lower() for e in excluded().values() if e.get("repo")}
    # Renames are why the repo name alone is not enough. `ccch1mneyyy/dsh-cc-tui`
    # became `ccch1mneyyy/DSH-TUI`; GitHub redirects, so the descriptor keeps
    # working, but a scan matching only on repo reports the package as new
    # every single day. The bundle name is what actually identifies it.
    have_bundles = {v["bundle"].lower() for v in have.values() if v["bundle"]}
    have_names = set(have)

    found, seen = [], set()
    for topic in TOPICS:
        hits = gh_search(topic, limit)
        print(f"  topic:{topic} -> {len(hits)} repos", file=sys.stderr)
        # Two calls per candidate: pin the head, then read package.json AT the
        # pin. Already-carried repos are dropped below without touching the
        # API, so they are not part of the estimate.
        rate_check(2 * len([h for h in hits
                            if h["full_name"].lower() not in have_repos]),
                   f"topic:{topic}")
        for r in hits:
            full = r["full_name"]
            if full.lower() in have_repos or full in seen:
                continue
            seen.add(full)
            if r.get("archived"):
                continue
            if not enough_stars(r.get("stargazers_count")):
                continue
            # Pin first, then read AT the pin. Taking the version from one
            # snapshot and the sha from another is how 19 of 169 descriptors
            # once ended up with a version key that did not describe the bytes
            # at their own commit; resolving in this order makes that
            # unrepresentable rather than merely unlikely.
            head = gh_json(f"repos/{full}/commits/{r.get('default_branch') or 'HEAD'}")
            commit = (head or {}).get("sha") or ""
            if not re.fullmatch(r"[0-9a-f]{40}", commit):
                continue
            # A dsh plugin is a profile bundle, and that is a declaration in
            # package.json -- not something the topic alone establishes. 169 of
            # the 281 repos carrying the topic actually declared it.
            pj = file_at(full, commit, "package.json")
            if not pj:
                continue
            try:
                meta = json.loads(pj)
            except json.JSONDecodeError:
                continue
            if not ((meta.get("dsh") or {}).get("bundle")):
                continue
            bundle = meta.get("name") or ""
            if bundle.lower() in have_bundles:
                print(f"  renamed upstream, already carried: {full} ({bundle})",
                      file=sys.stderr)
                continue
            name = full.split("/")[-1].lower().replace("_", "-")
            # Two different repos can normalise to the same descriptor name.
            # sync.py refuses to overwrite, which is the safe half; saying so
            # here is the other half, because a silent skip reads as "nothing
            # was found" rather than "a real package needs a different name".
            if name in have_names:
                print(f"  NAME COLLISION: {full} would be '{name}', already "
                      f"taken by {have[name]['repo']} -- needs a distinct name",
                      file=sys.stderr)
                continue
            found.append({
                "repo": full,
                "name": name,
                "bundle_name": bundle,
                "version": meta.get("version") or "",
                "commit": commit,
                "stars": r.get("stargazers_count") or 0,
                "license": ((r.get("license") or {}).get("spdx_id") or "unknown"),
                "default_branch": r.get("default_branch") or "",
                "needs_build": bool((meta.get("scripts") or {}).get("prepare")),
                "description": (r.get("description") or "").strip(),
            })
    return sorted(found, key=lambda f: -f["stars"])


def _parts(v: str):
    """A version as (core numbers, prerelease). None when it cannot be read."""
    core, _, pre = v.partition("-")
    bits = core.split(".")
    if not all(b.isdigit() for b in bits) or not bits:
        return None
    return ([int(b) for b in bits], pre)


def newer(new: str, old: str):
    """Is `new` strictly after `old`? None when the two cannot be compared.

    Equality is not the only thing worth skipping: upstream package.json
    versions go BACKWARDS. `oh-dsh-desktop` sat at 0.1.2 here while its head
    declared 0.1.1, and a bump that only checked inequality proposed the
    downgrade -- with a fresh pin, so the index would have started serving
    older bytes under a lower version number as if it were an update.
    """
    a, b = _parts(new), _parts(old)
    if a is None or b is None:
        return None
    if a[0] != b[0]:
        # Pad so 1.2 and 1.2.0 compare as equal rather than as a downgrade.
        n = max(len(a[0]), len(b[0]))
        av = a[0] + [0] * (n - len(a[0]))
        bv = b[0] + [0] * (n - len(b[0]))
        return av > bv
    # Same numbers: a release supersedes its own prereleases, and two
    # prereleases only compare to each other as text.
    if a[1] == b[1]:
        return False
    if not a[1]:
        return True
    if not b[1]:
        return False
    return a[1] > b[1]


def mode_bump() -> list:
    out = []
    have = carried()
    rate_check(2 * len(have), "--bump")
    for name, cur in sorted(have.items()):
        head = gh_json(f"repos/{cur['repo']}/commits?per_page=1")
        if not head:
            continue
        sha = (head[0] or {}).get("sha") or ""
        if not sha or sha == cur["commit"]:
            continue
        pj = file_at(cur["repo"], sha, "package.json")
        version = ""
        if pj:
            try:
                version = json.loads(pj).get("version") or ""
            except json.JSONDecodeError:
                pass
        # A moved head with the same version is upstream iterating, not a
        # release. Following it would repin bytes under an unchanged version
        # number, which is the one thing a version key must never mean.
        if not version or version == cur["version"]:
            continue
        ahead = newer(version, cur["version"])
        if ahead is False:
            print(f"  behind, not following: {name} {cur['version']} -> "
                  f"{version} ({cur['repo']})", file=sys.stderr)
            continue
        if ahead is None:
            print(f"  UNCOMPARABLE versions, needs a human: {name} "
                  f"{cur['version']} vs {version} ({cur['repo']})",
                  file=sys.stderr)
            continue
        out.append({"name": name, "repo": cur["repo"], "from": cur["version"],
                    "to": version, "commit": sha, "was": cur["commit"]})
    return out


def mode_audit() -> list:
    """Pins whose upstream is gone, each marked with whether it survives.

    A vanished upstream is not one event, it is two, and they need opposite
    answers. If this index mirrored the version, it already holds those exact
    bytes under a sha256 in xlings-res: `xlings install dsh:<pkg>` keeps
    working, nobody downstream notices, and the descriptor keeps a promise it
    can still keep. If it did not, the descriptor is a pointer at a repo that
    no longer exists -- it promises bytes nobody can fetch, and the only
    honest fix is to remove it.

    So only the un-mirrored half fails the run. Failing on the mirrored half
    would demand action on packages that are working fine, and an alarm that
    fires for something nobody should act on stops being read.
    """
    gone = []
    have = carried()
    rate_check(len(have), "--audit")
    for name, cur in sorted(have.items()):
        if not cur["commit"]:
            continue
        if gh_json(f"repos/{cur['repo']}/commits/{cur['commit']}") is None:
            gone.append({"name": name, "repo": cur["repo"],
                         "commit": cur["commit"], "version": cur["version"],
                         "mirrored": cur["mirrored"],
                         "verdict": "keep (served from the mirror)"
                                    if cur["mirrored"] else "REMOVE (no mirror)"})
    return gone


def main() -> int:
    ap = argparse.ArgumentParser()
    g = ap.add_mutually_exclusive_group(required=True)
    g.add_argument("--new", action="store_true")
    g.add_argument("--bump", action="store_true")
    g.add_argument("--audit", action="store_true")
    ap.add_argument("--json", default="")
    ap.add_argument("--limit", type=int, default=800)
    args = ap.parse_args()

    # A scan that could not complete must not write a result file. The
    # workflow reads its absence as "the audit could not run" rather than as
    # "nothing was found", which is the difference between a quiet night and a
    # false alarm that says 70 upstreams rewrote their history.
    try:
        if args.new:
            rows, label = mode_new(args.limit), "new plugin(s)"
        elif args.bump:
            rows, label = mode_bump(), "version update(s)"
        else:
            rows, label = mode_audit(), "vanished upstream(s) -- see each verdict"
    except GhError as e:
        print(f"\nSCAN DID NOT COMPLETE: {e}", file=sys.stderr)
        print("Nothing was written. This is NOT a report that anything is "
              "missing or that nothing was found.", file=sys.stderr)
        return 2

    if args.json:
        pathlib.Path(args.json).write_text(
            json.dumps(rows, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    for r in rows:
        print("  " + json.dumps(r, ensure_ascii=False))
    print(f"\n{len(rows)} {label}")

    # An UN-MIRRORED audit hit is the one result that must stop the pipeline:
    # the descriptor points at a repo that no longer exists and this index
    # holds no copy, so it promises bytes nobody can fetch. A mirrored one is
    # reported and does not fail -- those bytes are already here under a
    # sha256, `xlings install` still works, and demanding action on a package
    # that is fine is how an alarm stops being read.
    if args.audit:
        doomed = [r for r in rows if not r["mirrored"]]
        for r in rows:
            if r["mirrored"]:
                print(f"  kept: {r['name']} upstream is gone, but "
                      f"{r['version']} is mirrored -- installs from xlings-res",
                      file=sys.stderr)
        if doomed:
            print(f"\n{len(doomed)} descriptor(s) point at a repo that no "
                  f"longer exists and are NOT mirrored. Remove them:",
                  file=sys.stderr)
            for r in doomed:
                print(f"  git rm pkgs/{r['name'][0]}/{r['name']}.lua"
                      f"    # {r['repo']} is gone", file=sys.stderr)
            return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
