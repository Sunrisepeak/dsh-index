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
stopped keeping without saying so. It reports and exits non-zero; a human
decides.

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

ROOT = pathlib.Path(__file__).resolve().parent.parent
PKGS = ROOT / "pkgs"

TOPICS = ["dsh-plugin", "dsh-tool"]
# Below this the signal is not there yet: a repo with one star is usually its
# author's own. The index carried 100 such packages once and removing them was
# the single biggest quality change it has had, so the bar is applied at the
# door rather than after the fact.
MIN_STARS = 2


def gh_json(path: str):
    r = subprocess.run(["gh", "api", path], capture_output=True, text=True)
    if r.returncode != 0:
        return None
    try:
        return json.loads(r.stdout)
    except json.JSONDecodeError:
        return None


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
    """name -> {repo, commit, version} for every descriptor we already have."""
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
        vblock = re.search(rf'\["{re.escape(latest.group(1))}"\]\s*=\s*'
                           r'\{[^}]*commit = "([0-9a-f]{40})"', block)
        out[path.stem] = {
            "repo": repo.group(1).rstrip("/"),
            "version": latest.group(1),
            "commit": vblock.group(1) if vblock else "",
        }
    return out


def excluded() -> dict:
    p = ROOT / "tools" / "excluded.json"
    return json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}


def mode_new(limit: int) -> list:
    have_repos = {v["repo"].lower() for v in carried().values()}
    have_repos |= {e["repo"].lower() for e in excluded().values() if e.get("repo")}

    found, seen = [], set()
    for topic in TOPICS:
        hits = gh_search(topic, limit)
        print(f"  topic:{topic} -> {len(hits)} repos", file=sys.stderr)
        for r in hits:
            full = r["full_name"]
            if full.lower() in have_repos or full in seen:
                continue
            seen.add(full)
            if r.get("archived"):
                continue
            if (r.get("stargazers_count") or 0) < MIN_STARS:
                continue
            # A dsh plugin is a profile bundle, and that is a declaration in
            # package.json -- not something the topic alone establishes. 169 of
            # the 281 repos carrying the topic actually declared it.
            pj = file_at(full, r.get("default_branch") or "HEAD", "package.json")
            if not pj:
                continue
            try:
                meta = json.loads(pj)
            except json.JSONDecodeError:
                continue
            if not ((meta.get("dsh") or {}).get("bundle")):
                continue
            found.append({
                "repo": full,
                "name": full.split("/")[-1].lower().replace("_", "-"),
                "bundle_name": meta.get("name") or "",
                "version": meta.get("version") or "",
                "stars": r.get("stargazers_count") or 0,
                "license": ((r.get("license") or {}).get("spdx_id") or "unknown"),
                "default_branch": r.get("default_branch") or "",
                "needs_build": bool((meta.get("scripts") or {}).get("prepare")),
                "description": (r.get("description") or "").strip(),
            })
    return sorted(found, key=lambda f: -f["stars"])


def mode_bump() -> list:
    out = []
    for name, cur in sorted(carried().items()):
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
        if version and version == cur["version"]:
            continue
        out.append({"name": name, "repo": cur["repo"], "from": cur["version"],
                    "to": version, "commit": sha, "was": cur["commit"]})
    return out


def mode_audit() -> list:
    gone = []
    for name, cur in sorted(carried().items()):
        if not cur["commit"]:
            continue
        if gh_json(f"repos/{cur['repo']}/commits/{cur['commit']}") is None:
            gone.append({"name": name, "repo": cur["repo"],
                         "commit": cur["commit"], "version": cur["version"]})
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

    if args.new:
        rows, label = mode_new(args.limit), "new plugin(s)"
    elif args.bump:
        rows, label = mode_bump(), "version update(s)"
    else:
        rows, label = mode_audit(), "MISSING pinned commit(s)"

    if args.json:
        pathlib.Path(args.json).write_text(
            json.dumps(rows, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    for r in rows:
        print("  " + json.dumps(r, ensure_ascii=False))
    print(f"\n{len(rows)} {label}")

    # An audit hit is the one result that must stop the pipeline: it means an
    # already-published pin no longer exists, and every downstream step here
    # would otherwise carry on as if the index were intact.
    return 1 if (args.audit and rows) else 0


if __name__ == "__main__":
    raise SystemExit(main())
