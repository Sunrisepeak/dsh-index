#!/usr/bin/env python3
"""Apply what tools/discover.py found: write new descriptors, bump pinned ones.

Split from discover.py on purpose. Discovery is a read-only question about the
world and is safe to run on a schedule; this one edits the index, and the two
belong in separate PRs -- one per kind of change, as the repo's PR workflow
requires, so a reviewer of "12 new plugins" is never also reviewing a repin.

What this does NOT do is decide whether a package may be mirrored. That is a
licence question and it is answered by tools/mirror.py, which publishes the
tarball and only then writes the `mirror` block. A descriptor arriving here
starts un-mirrored, which is the fail-closed state: it installs from its
pinned commit and says so on its page.

Usage: tools/sync.py --new  <discover-new.json>
       tools/sync.py --bump <discover-bump.json>
"""
from __future__ import annotations

import argparse
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
PKGS = ROOT / "pkgs"

sys.path.insert(0, str(ROOT / "tools"))
from mine_profiles import documented_profile  # noqa: E402

MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}

TEMPLATE = '''package = {{
    spec = "1",

    name = {name},
    description = {desc},
    repo = "https://github.com/{repo}",
    homepage = "https://github.com/{repo}",
{licenses}    authors = {{{authors}}},

    status = "dev",
    categories = {{"dsh-plugin"}},
    keywords = {{"dsh"}},

    dsh = {{
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = {profile},

        bundle_name = {bundle},

        versions = {{
            [{version}] = {{ commit = "{commit}" }},
        }},
        latest = {version},

        needs_build = {needs_build},

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    }},
}}
'''


def lua_str(s: str) -> str:
    return '"' + str(s).replace("\\", "\\\\").replace('"', '\\"') + '"'


def path_for(name: str) -> pathlib.Path:
    return PKGS / name[0].lower() / f"{name}.lua"


def add_new(rows: list) -> int:
    written = 0
    for r in rows:
        p = path_for(r["name"])
        if p.exists():
            print(f"  skip {r['name']}: already carried", file=sys.stderr)
            continue
        if not re.fullmatch(r"[0-9a-f]{40}", r.get("commit", "")):
            print(f"  skip {r['name']}: no 40-hex commit", file=sys.stderr)
            continue
        lic = r.get("license") or ""
        licenses = (f'    licenses = {{{lua_str(lic)}}},\n'
                    if lic and lic not in ("unknown", "NOASSERTION", "NONE") else "")
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(TEMPLATE.format(
            name=lua_str(r["name"]),
            desc=lua_str(r.get("description") or r["name"]),
            repo=r["repo"],
            licenses=licenses,
            authors=lua_str(r["repo"].split("/")[0]),
            profile=lua_str(documented_profile(r["repo"]) or "web"),
            bundle=lua_str(r.get("bundle_name") or f'@dsh-external/{r["name"]}'),
            version=lua_str(r.get("version") or "0.0.0"),
            commit=r["commit"],
            needs_build="true" if r.get("needs_build") else "false",
        ), encoding="utf-8")
        written += 1
        print(f"  + {r['name']} {r.get('version','')} ({r['repo']})")
    return written


def bump(rows: list) -> int:
    changed = 0
    for r in rows:
        p = path_for(r["name"])
        if not p.exists():
            print(f"  skip {r['name']}: no descriptor", file=sys.stderr)
            continue
        body = p.read_text(encoding="utf-8")
        if not r.get("to") or not re.fullmatch(r"[0-9a-f]{40}", r.get("commit", "")):
            print(f"  skip {r['name']}: incomplete bump row", file=sys.stderr)
            continue
        if f'["{r["to"]}"]' in body:
            continue
        # Add the new version rather than replacing the old one. A previously
        # published version stays installable -- somebody may be pinned to it,
        # and its mirror tarball is already out there under that tag.
        anchor = re.search(r"( +)versions = \{\n", body)
        if not anchor:
            print(f"  skip {r['name']}: no versions block", file=sys.stderr)
            continue
        pad = anchor.group(1) + "    "
        entry = f'{pad}["{r["to"]}"] = {{ commit = "{r["commit"]}" }},\n'
        body = body[:anchor.end()] + entry + body[anchor.end():]
        body = re.sub(r'latest = "[^"]*"', f'latest = "{r["to"]}"', body)
        p.write_text(body, encoding="utf-8")
        changed += 1
        print(f"  ~ {r['name']} {r['from']} -> {r['to']}")
    return changed


def main() -> int:
    ap = argparse.ArgumentParser()
    g = ap.add_mutually_exclusive_group(required=True)
    g.add_argument("--new", action="store_true")
    g.add_argument("--bump", action="store_true")
    ap.add_argument("path")
    args = ap.parse_args()

    rows = json.loads(pathlib.Path(args.path).read_text(encoding="utf-8"))
    n = add_new(rows) if args.new else bump(rows)
    print(f"\n{n} descriptor(s) written")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
