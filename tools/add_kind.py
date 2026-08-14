#!/usr/bin/env python3
"""One-off: stamp `kind` and `profile` onto the existing plugin descriptors.

`kind` is what the three-tier model turns on -- plugin / group / profile --
and every descriptor written before that model existed is a plugin. Making it
explicit rather than leaving it to template.lua's fallback means a reader can
answer "what is this package" from the descriptor alone, and the schema test
can require it instead of accepting silence.

`profile` records where the package's own README tells its readers to install
it (tools/mine_profiles.py extracted it). It is written even when it equals
the `web` fallback: "this README says web" and "this README says nothing, so
we defaulted" are different facts, and only the first is auditable against
upstream.

Usage: tools/add_kind.py [--check]
"""
from __future__ import annotations

import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent


def main() -> int:
    check = "--check" in sys.argv
    profiles = {e["pkg"]: e["profile"]
                for e in json.loads((ROOT / "tools" / "profiles.json").read_text())}

    missing, changed = [], 0
    for f in sorted((ROOT / "pkgs").rglob("*.lua")):
        body = f.read_text(encoding="utf-8")
        if "kind = " in body:
            continue
        m = re.search(r'^(    dsh = \{\n)', body, re.M)
        if not m:
            missing.append(f.name)
            continue
        prof = profiles.get(f.stem)
        if prof is None:
            missing.append(f.name)
            continue
        ins = (f'        kind = "plugin",\n'
               f'        -- Where this plugin\'s own README tells readers to install it.\n'
               f'        profile = "{prof}",\n\n')
        body = body[:m.end()] + ins + body[m.end():]
        changed += 1
        if not check:
            f.write_text(body, encoding="utf-8")

    if missing:
        print("no dsh block or no mined profile: " + ", ".join(missing), file=sys.stderr)
        return 1
    print(f"{'would stamp' if check else 'stamped'} {changed} descriptors")
    return 1 if (check and changed) else 0


if __name__ == "__main__":
    raise SystemExit(main())
