#!/usr/bin/env python3
"""Record which @deepseek-ai/dsh-base rows each bundle overrides.

Two plugins conflict when they patch the SAME row id: a patch replaces a row's
whole config rather than merging, so the later layer silently wins. That is the
real unit of conflict here -- not the package, and not a category. xpkg has no
`conflicts` field (checked: no such declaration in the spec, in 150+ recipes, or
in xlings itself), and it would not fit anyway, because what collides is a row.

Measured across this index: only 5 of 68 bundles touch a base row at all, and
exactly two pairs actually collide -- dsh-cc-tui vs dsh-tui on `system-prompt`,
and dsh-cc-tui vs dsh-plugin-yet-another-subagent on `tool-subagent`. Rows a
bundle adds under its own id are not conflicts; they compose.

Usage: tools/mine_overrides.py <base-cordis.patch.yml> [--write]
"""
from __future__ import annotations

import base64
import pathlib
import re
import subprocess
import sys

ID = re.compile(r"^\s*-?\s*id:\s*([A-Za-z0-9_.-]+)")


def ids_of(text: str) -> set[str]:
    return {m.group(1) for m in (ID.match(l) for l in text.splitlines()) if m}


def fetch_patch(repo: str, rel: str) -> str:
    r = subprocess.run(["gh", "api", f"repos/{repo}/contents/{rel}", "--jq", ".content"],
                       capture_output=True, text=True)
    if r.returncode != 0 or not r.stdout.strip():
        return ""
    try:
        return base64.b64decode(r.stdout).decode("utf-8", "replace")
    except Exception:
        return ""


def main() -> int:
    base_rows = ids_of(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
    write = "--write" in sys.argv
    touched = 0
    for f in sorted(pathlib.Path("pkgs").rglob("*.lua")):
        body = f.read_text(encoding="utf-8")
        repo = re.search(r'repo = "https://github.com/([^"]+)"', body).group(1)
        m = re.search(r'patch = "([^"]+)"', body)
        rel = (m.group(1) if m else "./cordis.patch.yml").lstrip("./")
        overrides = sorted(ids_of(fetch_patch(repo, rel)) & base_rows)
        if not overrides:
            continue
        touched += 1
        print(f"  {f.stem:<32} {', '.join(overrides)}")
        if write and "overrides = {" not in body:
            anchor = "        needs_build = "
            i = body.index(anchor)
            lst = ", ".join(f'"{o}"' for o in overrides)
            ins = ("        -- Base rows this bundle replaces. Another bundle patching\n"
                   "        -- any of these in the same profile silently wins or loses,\n"
                   "        -- depending on install order.\n"
                   f"        overrides = {{{lst}}},\n")
            f.write_text(body[:i] + ins + body[i:], encoding="utf-8")
    print(f"\n{touched} bundles override a base row")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
