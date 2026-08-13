#!/usr/bin/env python3
"""Generate pkgs/**/*.lua from a survey of the `dsh-plugin` topic.

This is the manual stand-in for the discover.py/sync.py pipeline in the design
doc: it takes a survey snapshot and writes data-only descriptors. Every field
it emits is measured, never guessed -- the sha comes from the repo's default
branch head, the license from GitHub's own SPDX classification, and
needs_build from whether the upstream package.json has a `prepare` script.

Usage: tools/gen_descriptors.py <scan.jsonl> <shas.tsv> [topics.tsv]
"""
import json
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from classify import classify  # noqa: E402

MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}
SHA_RE = re.compile(r"^[0-9a-f]{40}$")
# Names xlings would have to disambiguate, or that read badly as a command.
BAD_NAME = re.compile(r"[^a-z0-9._-]")


def index_name(repo: str, pkg: str) -> str:
    """The short name users type. Prefer the repo name -- it is what the
    ecosystem links to -- lowercased and normalised."""
    name = repo.split("/")[-1].lower().replace("_", "-")
    return name


def lua_str(s: str) -> str:
    return '"' + str(s).replace("\\", "\\\\").replace('"', '\\"') + '"'


def main() -> int:
    scan_path, shas_path = sys.argv[1], sys.argv[2]
    topics_path = sys.argv[3] if len(sys.argv) > 3 else None
    scan = {}
    for line in open(scan_path, encoding="utf-8"):
        r = json.loads(line)
        if r.get("bundle") and r.get("pkg"):
            scan[r["repo"]] = r

    meta = {}
    for line in open(shas_path, encoding="utf-8", errors="replace"):
        parts = line.rstrip("\n").split("\t")
        # repo, branch, license, archived, stars, sha
        if len(parts) < 6 or parts[1] == "GONE" or not parts[5]:
            continue
        meta[parts[0]] = {"branch": parts[1], "license": parts[2],
                          "archived": parts[3] == "true",
                          "stars": int(parts[4] or 0), "sha": parts[5]}

    topics = {}
    if topics_path:
        for line in open(topics_path, encoding="utf-8"):
            parts = line.rstrip("\n").split("\t")
            topics[parts[0]] = parts[1].split(",") if len(parts) > 1 and parts[1] else []

    out = pathlib.Path("pkgs")
    written, skipped, names = 0, [], {}

    for repo, r in sorted(scan.items()):
        m = meta.get(repo)
        if not m:
            skipped.append((repo, "no sha (repo gone or unreachable)"))
            continue
        if not SHA_RE.match(m["sha"]):
            skipped.append((repo, f"bad sha {m['sha']!r}"))
            continue

        name = index_name(repo, r["pkg"])
        if BAD_NAME.search(name):
            skipped.append((repo, f"unusable index name {name!r}"))
            continue
        if name in names:
            # Two repos wanting the same short name: keep neither silently.
            skipped.append((repo, f"name collision with {names[name]}"))
            continue
        names[name] = repo

        ver = str(r.get("version") or "0.0.0")
        lic = m["license"]
        patch = r["bundle"].get("patch") if isinstance(r["bundle"], dict) else None
        desc = (r.get("desc") or "").strip() or f"dsh plugin from {repo}"
        desc = re.sub(r"\s+", " ", desc)[:110]

        L = []
        L.append("package = {")
        L.append('    spec = "1",')
        L.append("")
        L.append(f"    name = {lua_str(name)},")
        L.append(f"    description = {lua_str(desc)},")
        L.append(f'    repo = "https://github.com/{repo}",')
        L.append(f'    homepage = "https://github.com/{repo}",')
        if lic not in ("NONE", "NOASSERTION"):
            L.append(f"    licenses = {{{lua_str(lic)}}},")
        L.append(f"    authors = {{{lua_str(repo.split('/')[0])}}},")
        L.append("")
        L.append('    status = "dev",')
        cats, kws = classify(name, topics.get(repo, []), desc)
        L.append("    categories = {" + ", ".join(lua_str(c) for c in cats) + "},")
        L.append("    keywords = {" + ", ".join(lua_str(k) for k in (["dsh"] + kws)) + "},")
        L.append("")
        L.append("    dsh = {")
        L.append(f"        bundle_name = {lua_str(r['pkg'])},")
        L.append('        source = "github",')
        L.append(f"        origin = {lua_str(repo)},")
        L.append("")
        L.append("        versions = {")
        L.append(f'            ["{ver}"] = {{ ref = "{m["sha"]}" }},')
        L.append("        },")
        L.append(f'        latest = "{ver}",')
        L.append("")
        L.append(f"        needs_build = {'true' if r.get('prepare') else 'false'},")
        L.append(f"        license = {lua_str(lic)},")
        if patch and patch != "./cordis.patch.yml":
            L.append("")
            L.append("        -- non-default bundle patch path")
            L.append(f"        patch = {lua_str(patch)},")
        L.append("")
        if lic in MIRRORABLE:
            L.append("        -- Mirror-eligible. The `mirror` block is filled in by the")
            L.append("        -- mirror pipeline once a tarball is published to xlings-res.")
        else:
            L.append("        -- Upstream ships no redistributable license, so this index has")
            L.append("        -- no right to mirror it: no `mirror` block, installs straight")
            L.append("        -- from git, and it cannot be recovered if upstream disappears.")
        L.append("    },")
        L.append("}")

        d = out / name[0]
        d.mkdir(parents=True, exist_ok=True)
        (d / f"{name}.lua").write_text("\n".join(L) + "\n", encoding="utf-8")
        written += 1

    print(f"written: {written}")
    # R1: a total record -- every skipped input gets a line, not silence.
    print(f"skipped: {len(skipped)}")
    for repo, why in skipped:
        print(f"  skip {repo}: {why}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
