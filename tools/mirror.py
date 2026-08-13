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
  6. publish to GitHub AND GitCode with a .sha256 sidecar on each
  7. download from both and compare against the local digest, three ways
  8. print the mirror block for the descriptor

Both mirrors or neither: `cn = true` is only written after the GitCode URL has
actually served the right bytes. A CN URL that 404s is worse than none -- a
user on the CN mirror gets a failed download instead of a fallback, and the
index would advertise an acceleration it does not have.

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
# GitCode publishing goes through the org's existing tool rather than a second
# implementation of the same API.
GTC = pathlib.Path(__file__).resolve().parents[2] / "xim-pkgindex" / "tools" / "gtc"
CN_URL = ("https://gitcode.com/{repo}/releases/download/{tag}/{asset}")
MIRRORABLE = {"MIT", "BSD-3-Clause", "Apache-2.0", "GPL-3.0"}


def run(cmd, cwd=None, check=True, capture=True):
    """Run a command, and when it fails say what IT said.

    This used to let CalledProcessError propagate, so the batch report recorded
    a Python traceback instead of the tool's own error. 35 of 55 refusals came
    back as "pnpm install returned non-zero" with no cause -- a record that
    cannot answer "why" without re-running everything is not a record.
    """
    r = subprocess.run(cmd, cwd=cwd, check=False, text=True,
                       capture_output=capture)
    if check and r.returncode != 0:
        detail = ""
        for stream in ((r.stderr or ""), (r.stdout or "")):
            hit = [ln for ln in stream.splitlines()
                   if "ERR_" in ln or "ERROR" in ln or ln.startswith("error")]
            if hit:
                detail = hit[0].strip()
                break
        if not detail:
            tail = [ln for ln in ((r.stderr or r.stdout or "").splitlines()) if ln.strip()]
            detail = tail[-1].strip() if tail else "no output"
        fail(f"{cmd[0]} failed ({r.returncode}): {detail[:300]}")
    return r


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
    versions = dict(re.findall(r'\["([^"]+)"\]\s*=\s*\{\s*commit\s*=\s*"([0-9a-f]{40})"', block))
    repo_url = field(body, "repo") or ""
    lic = re.search(r'licenses\s*=\s*\{"([^"]+)"', body)
    return {
        "name": field(body, "name"),
        # Derived, not stored: `repo` is the standard xpkg field and a second
        # copy of the same fact is a second thing to keep in sync.
        "origin": repo_url.split("github.com/", 1)[-1].rstrip("/") if "github.com/" in repo_url else "",
        "bundle_name": field(block, "bundle_name"),
        "license": lic.group(1) if lic else "NONE",
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
        # Captured, not streamed. Streaming showed live progress but left
        # nothing to quote when it failed, so the batch report said only
        # "pnpm failed (1): no output" -- the same blind spot one layer down.
        run(["pnpm", "install", "--config.dangerouslyAllowAllBuilds=true"],
            cwd=src)

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
            print(f"[5/8] publish {tag} to GitHub")
            run(["gh", "release", "create", tag, "--repo", RES_REPO,
                 "--title", tag,
                 "--notes", f"Mirror of https://github.com/{d['origin']} at {sha}\n\n"
                            f"License: {d['license']} (redistributed under its terms; "
                            f"the upstream LICENSE ships inside the tarball)\n"
                            f"sha256: {digest}",
                 str(final), str(work / f"{asset}.sha256")])

            cn_ok = False
            if GTC.is_file():
                print(f"[6/8] publish {tag} to GitCode")
                notes = work / "notes.md"
                notes.write_text(
                    f"Mirror of https://github.com/{d['origin']} at {sha}\n\n"
                    f"License: {d['license']} (redistributed under its terms; the "
                    f"upstream LICENSE ships inside the tarball)\n"
                    f"sha256: {digest}\n\nByte-identical to the GitHub release "
                    f"of the same tag.\n", encoding="utf-8")
                run([sys.executable, str(GTC), "release", "publish", RES_REPO,
                     "--tag", tag, "--name", tag, "--body-file", str(notes),
                     "--target", "main",
                     "--asset", str(final),
                     "--asset", str(work / f"{asset}.sha256")])
                cn_ok = True
            else:
                print(f"[6/8] gtc not found at {GTC}; GitHub only, no CN")

            # Three-way: the bytes we built, what GitHub serves, what GitCode
            # serves. Comparing only against our own digest would not catch a
            # mirror that stored something else.
            print("[7/8] compare local / GLOBAL / CN")
            gl = work / "gl.tgz"
            run(["gh", "release", "download", tag, "--repo", RES_REPO,
                 "--pattern", asset, "--output", str(gl), "--clobber"])
            if hashlib.sha256(gl.read_bytes()).hexdigest() != digest:
                fail(f"{name}: GitHub serves different bytes than were built")

            if cn_ok:
                cn = work / "cn.tgz"
                url = CN_URL.format(repo=RES_REPO, tag=tag, asset=asset)
                rc = subprocess.run(["curl", "-sfL", "-o", str(cn), url]).returncode
                if rc != 0 or hashlib.sha256(cn.read_bytes()).hexdigest() != digest:
                    # Not fatal: publish GitHub-only and leave cn unset, so the
                    # template simply omits the CN URL.
                    print(f"WARNING: CN mirror did not serve matching bytes; "
                          f"leaving cn unset", file=sys.stderr)
                    cn_ok = False
        else:
            cn_ok = False
            print(f"[5/8] --publish not given; would publish tag {tag}")
            print("[6/8] [7/8] skipped")

        print()
        print(f"        mirror = {{")
        print(f'            ["{version}"] = {{')
        print(f'                tarball = "{asset}",')
        print(f'                sha256  = "{digest}",')
        if cn_ok:
            print(f'                cn      = true,')
        print(f"            }},")
        print(f"        }},")
        return 0
    finally:
        shutil.rmtree(work, ignore_errors=True)


if __name__ == "__main__":
    raise SystemExit(main())
