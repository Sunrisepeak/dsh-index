#!/usr/bin/env python3
"""Run tools/mirror.py over every mirror-eligible descriptor and record results.

Every package gets a line in the report whether it was published, skipped or
refused -- "was this one considered?" must be answerable without re-running
anything. A silent skip in a batch of 127 is indistinguishable from a package
that was never there.

Usage: tools/mirror_all.py [--publish] [--limit N]
"""
from __future__ import annotations

import argparse
import json
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}


def license_of(body: str) -> str:
    m = re.search(r'licenses\s*=\s*\{"([^"]+)"', body)
    return m.group(1) if m else "NONE"


def has_mirror(body: str) -> bool:
    return "mirror = {" in body


def patch_descriptor(path: pathlib.Path, block: str) -> bool:
    body = path.read_text(encoding="utf-8")
    placeholder = ("        -- Mirror-eligible. The `mirror` block is filled in by the\n"
                   "        -- mirror pipeline once a tarball is published to xlings-res.")
    if placeholder not in body:
        return False
    path.write_text(body.replace(placeholder, block.rstrip()), encoding="utf-8")
    return True


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--publish", action="store_true")
    ap.add_argument("--limit", type=int, default=0)
    args = ap.parse_args()

    report = []
    done = 0
    for path in sorted((ROOT / "pkgs").rglob("*.lua")):
        body = path.read_text(encoding="utf-8")
        name = path.stem
        lic = license_of(body)

        if has_mirror(body):
            report.append({"pkg": name, "status": "already-mirrored", "license": lic})
            continue
        if lic not in MIRRORABLE:
            report.append({"pkg": name, "status": "not-mirrorable", "license": lic})
            continue
        if args.limit and done >= args.limit:
            report.append({"pkg": name, "status": "skipped-limit", "license": lic})
            continue

        cmd = [sys.executable, str(ROOT / "tools" / "mirror.py"), str(path)]
        if args.publish:
            cmd.append("--publish")
        r = subprocess.run(cmd, capture_output=True, text=True)
        done += 1

        if r.returncode != 0:
            why = (r.stderr.strip().splitlines() or ["unknown"])[-1]
            report.append({"pkg": name, "status": "refused", "license": lic, "why": why[:200]})
            print(f"  REFUSED {name}: {why[:120]}", flush=True)
            continue

        m = re.search(r"( {8}mirror = \{.*?\n {8}\},)", r.stdout, re.S)
        if not m:
            report.append({"pkg": name, "status": "no-block", "license": lic})
            print(f"  NO BLOCK {name}", flush=True)
            continue

        ok = patch_descriptor(path, m.group(1)) if args.publish else True
        report.append({"pkg": name, "status": "published" if args.publish else "dry-run",
                       "license": lic, "patched": ok,
                       "cn": "cn      = true" in m.group(1)})
        print(f"  ok {name} (cn={'cn      = true' in m.group(1)})", flush=True)

    (ROOT / "tools" / "mirror-report.json").write_text(
        json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    from collections import Counter
    counts = Counter(r["status"] for r in report)
    print("\n=== report ===")
    for k, v in counts.most_common():
        print(f"  {k:<18} {v}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
