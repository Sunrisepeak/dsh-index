#!/usr/bin/env python3
"""Publish a plugin tarball to xlings-res/dsh-plugins and fill its mirror block.

Mirroring is redistribution, so every step here is a gate rather than a
convenience. The pipeline refuses rather than degrades: a package that fails
any check keeps no `mirror` block and stays on the direct path, which the site
labels honestly. A `mirror` block that does not resolve would promise
reproducibility this index cannot deliver -- worse than no mirror at all.

Steps, in order:

  1. clone at the pinned sha and verify HEAD is exactly that sha
  2. re-check the license against the descriptor -- upstream can relicense,
     so a decision made at discovery time is not valid forever
  3. install deps and run the package's own `prepare` (this is where the
     arbitrary-code execution happens: in CI, once, instead of on every
     user's machine at install time)
  4. `pnpm pack`
  5. verify the tarball actually contains what a bundle needs: the manifest,
     the patch file it points at, and the `main` entry
  6. publish to GitHub with a .sha256 sidecar
  7. print the mirror block for the descriptor

Usage:
  tools/mirror.py <pkgs/x/name.lua> [--publish]

Without --publish it does everything except step 6, so the gates can be
exercised without touching the release repo.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile

RES_REPO = "xlings-res/dsh-plugins"
MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}


def run(cmd, cwd=None, check=True, capture=True):
    return subprocess.run(cmd, cwd=cwd, check=check, text=True,
                          capture_output=capture)


def field(body: str, name: str):
    m = re.search(rf'{name}\s*=\s*"([^"]*)"', body)
    return m.group(1) if m else None


def parse_descriptor(path: pathlib.Path) -> dict:
    body = path.read_text(encoding="utf-8")
    i = body.index("dsh = {")
    depth, block = 0, ""
    for k in range(i + len("dsh = "), len(body)):
        if body[k] == "{":
            depth += 1
        elif body[k] == "}":
            depth -= 1
            if depth == 0:
                block = body[i:k + 1]
                break
    versions = dict(re.findall(r'\["([^"]+)"\]\s*=\s*\{\s*ref\s*=\s*"([0-9a-f]{40})"', block))
    return {
        "name": field(body, "name"),
        "origin": field(block, "origin"),
        "bundle_name": field(block, "bundle_name"),
        "license": field(block, "license"),
        "latest": field(block, "latest"),
        "patch": field(block, "patch") or "./cordis.patch.yml",
        "versions": versions,
        "has_mirror": "mirror = {" in block,
    }


def fail(msg: str) -> "NoReturn":  # noqa: F821
    print(f"REFUSED: {msg}", file=sys.stderr)
    raise SystemExit(1)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("descriptor")
    ap.add_argument("--version", default="", help="defaults to dsh.latest")
    ap.add_argument("--publish", action="store_true")
    args = ap.parse_args()

    d = parse_descriptor(pathlib.Path(args.descriptor))
    version = args.version or d["latest"]
    sha = d["versions"].get(version)
    name = d["name"]

    if not sha:
        fail(f"{name}: no pinned sha for version {version}")

    # Gate 1: the license must permit redistribution. This is re-checked
    # against GitHub below; the descriptor value alone is not authority.
    if d["license"] not in MIRRORABLE:
        fail(f"{name}: license {d['license']!r} does not grant redistribution")

    live = run(["gh", "api", f"repos/{d['origin']}",
                "--jq", '.license.spdx_id // "NONE"']).stdout.strip()
    if live != d["license"]:
        fail(f"{name}: upstream license is now {live!r}, descriptor says "
             f"{d['license']!r} -- a mirror decision is not valid forever")

    work = pathlib.Path(tempfile.mkdtemp(prefix=f"mirror-{name}-"))
    try:
        src = work / "src"
        print(f"[1/6] clone {d['origin']} at {sha[:12]}")
        run(["git", "clone", "--quiet", f"https://github.com/{d['origin']}.git", str(src)])
        run(["git", "checkout", "--quiet", sha], cwd=src)
        head = run(["git", "rev-parse", "HEAD"], cwd=src).stdout.strip()
        if head != sha:
            fail(f"{name}: HEAD is {head}, expected the pinned {sha}")

        # Gate 2: the LICENSE file must actually be in the tree we are about
        # to redistribute, not merely claimed by the repo metadata.
        if not any((src / n).exists() for n in
                   ("LICENSE", "LICENSE.md", "LICENSE.txt", "COPYING")):
            fail(f"{name}: no LICENSE file in the tree at {sha[:12]}")

        print(f"[2/6] install deps and build ({d['license']})")
        # `dangerouslyAllowAllBuilds` is the whole point of this pipeline, not
        # a workaround. pnpm >=10 refuses transitive build scripts
        # (ERR_PNPM_IGNORED_BUILDS) and it is right to: running them executes
        # third-party code. Mirroring accepts that cost ONCE, here, in CI, so
        # that the tarball users install is prebuilt and they never have to set
        # DSH_ALLOW_BUILDS on their own machine. Everything this runs is
        # pinned: the plugin at a verified sha, its deps by the committed
        # lockfile.
        run(["pnpm", "install", "--config.dangerouslyAllowAllBuilds=true"],
            cwd=src, capture=False)

        print("[3/6] pnpm pack")
        out = run(["pnpm", "pack", "--pack-destination", str(work)], cwd=src).stdout
        tgz = next((work.glob("*.tgz")), None)
        if not tgz:
            fail(f"{name}: pnpm pack produced no tarball\n{out}")

        print(f"[4/6] verify payload of {tgz.name}")
        listing = run(["tar", "-tzf", str(tgz)]).stdout.splitlines()
        entries = {p.split("/", 1)[1] for p in listing if "/" in p}
        manifest = json.loads(run(["tar", "-xzOf", str(tgz), "package/package.json"]).stdout)

        # Gate 3: the version in the descriptor must be the version at the
        # pinned sha. These came from two snapshots taken minutes apart the
        # first time and silently disagreed -- the asset would have been
        # labelled 0.1.2 while containing 0.1.6. An index whose version keys
        # do not match the bytes is worse than one with fewer versions.
        packed_version = str(manifest.get("version") or "")
        if packed_version != version:
            fail(f"{name}: descriptor says version {version!r} but package.json "
                 f"at {sha[:12]} says {packed_version!r} -- the version key and "
                 f"the pinned commit disagree")

        bundle = (manifest.get("dsh") or {}).get("bundle") or {}
        if not bundle:
            fail(f"{name}: packed manifest declares no dsh.bundle; it would "
                 f"install as a plain dependency and activate no layer")
        patch = str(bundle.get("patch") or "./cordis.patch.yml").lstrip("./")
        if patch not in entries:
            fail(f"{name}: bundle patch {patch!r} is not in the tarball -- "
                 f"the layer would be unresolvable")
        main_entry = str(manifest.get("main") or "").lstrip("./")
        if main_entry and main_entry not in entries:
            fail(f"{name}: main {main_entry!r} missing from the tarball "
                 f"(a TypeScript package packed without building)")

        digest = hashlib.sha256(tgz.read_bytes()).hexdigest()
        asset = f"{name}-{version}.tgz"
        final = work / asset
        shutil.move(str(tgz), final)
        (work / f"{asset}.sha256").write_text(f"{digest}  {asset}\n", encoding="utf-8")

        tag = f"{name}-{version}"
        if args.publish:
            print(f"[5/6] publish {tag} to {RES_REPO}")
            run(["gh", "release", "create", tag, "--repo", RES_REPO,
                 "--title", tag,
                 "--notes", f"Mirror of https://github.com/{d['origin']} at {sha}\n\n"
                            f"License: {d['license']} (redistributed under its terms; "
                            f"the upstream LICENSE ships inside the tarball)\n"
                            f"sha256: {digest}",
                 str(final), str(work / f"{asset}.sha256")], capture=False)

            print("[6/6] verify the published bytes round-trip")
            check = work / "roundtrip.tgz"
            run(["gh", "release", "download", tag, "--repo", RES_REPO,
                 "--pattern", asset, "--output", str(check), "--clobber"])
            back = hashlib.sha256(check.read_bytes()).hexdigest()
            if back != digest:
                fail(f"{name}: published bytes differ ({back} != {digest})")
        else:
            print(f"[5/6] --publish not given; would publish tag {tag}")
            print("[6/6] skipped")

        print()
        print(f"        mirror = {{")
        print(f'            ["{version}"] = {{')
        print(f'                tarball = "{asset}",')
        print(f'                sha256  = "{digest}",')
        print(f"            }},")
        print(f"        }},")
        return 0
    finally:
        shutil.rmtree(work, ignore_errors=True)


if __name__ == "__main__":
    raise SystemExit(main())
