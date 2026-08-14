#!/usr/bin/env python3
"""Record which bundles install from npm by name, and at which versions.

The site shows dsh's own install command before this index's one (design 6.1),
and that command's spec differs per package: a bundle published to npm installs
by name, everything else installs from its pinned git commit. Deciding which by
the shape of `bundle_name` would be wrong -- `bundle_name` is the package's own
package.json name, and a bare name does not imply publication. Measured: of 68
packages, 19 carry the synthetic `@dsh-external/` prefix and only 18 of the
remaining 49 resolve on npm at all.

The NAME is not enough either. Our pinned version may have been unpublished
since -- dsh-cc-tui is pinned at 0.1.6 while npm has moved to 0.2.0 -- so a
command naming a version npm no longer serves would 404 just as loudly as a
name it never had. Both are resolved here, at generation time, and the result
is committed: the site must not query npm while rendering.

Usage: tools/check_npm.py [--check]
"""
from __future__ import annotations

import json
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "tools" / "npm.json"


def field(body: str, name: str):
    m = re.search(rf'{name}\s*=\s*"([^"]*)"', body)
    return m.group(1) if m else None


def npm_versions(name: str) -> list:
    r = subprocess.run(["npm", "view", name, "versions", "--json"],
                       capture_output=True, text=True, timeout=90)
    if r.returncode != 0 or not r.stdout.strip():
        return []
    try:
        v = json.loads(r.stdout)
    except json.JSONDecodeError:
        return []
    return v if isinstance(v, list) else [v]


def main() -> int:
    check = "--check" in sys.argv
    out = {}
    for path in sorted((ROOT / "pkgs").rglob("*.lua")):
        body = path.read_text(encoding="utf-8")
        block = body[body.index("dsh = {"):]
        if field(block, "kind") != "plugin":
            continue
        bundle = field(block, "bundle_name") or ""
        pinned = field(block, "latest") or ""
        # The synthetic scope this index assigns to a bundle that publishes no
        # npm name of its own. Never resolvable; skip the network call.
        if not bundle or bundle.startswith("@dsh-external/"):
            continue
        vs = npm_versions(bundle)
        if not vs:
            continue
        out[path.stem] = {"name": bundle, "versions": vs,
                          "pinned_published": pinned in vs}
        print(f"  {path.stem:<40} {bundle}"
              f"{'' if pinned in vs else f'  (pinned {pinned} NOT on npm)'}")

    text = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if check:
        if not OUT.exists() or OUT.read_text(encoding="utf-8") != text:
            print("tools/npm.json is out of date; re-run tools/check_npm.py",
                  file=sys.stderr)
            return 1
        return 0
    OUT.write_text(text, encoding="utf-8")
    usable = sum(1 for v in out.values() if v["pinned_published"])
    print(f"\n{len(out)} bundles on npm, {usable} with the pinned version still served")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
