#!/usr/bin/env python3
"""Which units does this change actually need booted?

The boot gate used to install both Agents on every push, which was wrong in
both directions at once: a PR adding one plugin paid 3m43s to boot seven
packages it had not touched, and never once booted the package it HAD touched.
So the unit of work is derived from the diff instead of from a constant.

Two rules do the work.

**Fail open.** Only an explicit allowlist of paths that cannot reach a boot
(docs, the site, agent notes, markdown) yields "nothing to boot". Anything this
script does not recognise -- a new top-level file, a new tools/ script -- falls
through to a full run. Being slow is recoverable; silently skipping the gate on
a change nobody classified is not.

**Both directions of the closure.** A changed plugin needs itself booted AND
every composite that names it as a member: composites pin each member's version
and commit, so touching a member can invalidate the composition the index
published. The static suite already proves the pins reconcile; only a boot
proves those bytes still start together.

Usage:
  tools/affected.py --files -            < changed-paths.txt
  tools/affected.py --files - --full     # force every composite
  tools/affected.py --files - --github-output   # also write $GITHUB_OUTPUT
"""
from __future__ import annotations

import argparse
import json
import os
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent

# The surface a lone plugin has to be booted on top of. A plugin declares where
# its own README tells readers to install it (`dsh.profile`); booting it on a
# bare dsh-base instead asks a question this index never promised an answer to
# -- 64 of 70 descriptors say "web", and on bare base they have no UI to attach
# to. Values here are bundle names, not descriptor names.
SURFACE_FOR_PROFILE = {
    "web": "@deepseek-ai/dsh-web-app",   # ships inside dsh; nothing to install
    "tui": "dsh-cc-tui",                 # an index package: must be installed
    "cc-tui": "dsh-cc-tui",
}
# Surfaces that are themselves packages in this index, keyed by bundle name.
SURFACE_PACKAGE = {"dsh-cc-tui": "dsh-cc-tui"}

COMPOSITE_KINDS = {"group", "profile"}

# Cannot reach a boot. Everything not matched here is a full run (see the
# fail-open rule above) -- this list is the only way to get an empty result,
# which is what keeps "we skipped the gate" a deliberate act.
NO_BOOT_PREFIXES = ("docs/", "site/", ".agents/")
NO_BOOT_EXACT = {"LICENSE", ".gitignore"}


def _dsh_block(body: str) -> str:
    i = body.index("dsh = {")
    depth = 0
    for k in range(i + len("dsh = "), len(body)):
        if body[k] == "{":
            depth += 1
        elif body[k] == "}":
            depth -= 1
            if depth == 0:
                return body[i:k + 1]
    raise ValueError("unterminated dsh block")


def descriptors(root: pathlib.Path = ROOT) -> dict:
    """name -> {kind, profile, members}. Members are descriptor names."""
    out = {}
    for path in sorted((root / "pkgs").rglob("*.lua")):
        body = path.read_text(encoding="utf-8")
        try:
            block = _dsh_block(body)
        except ValueError:
            continue
        kind = re.search(r'kind = "([^"]+)"', block)
        profile = re.search(r'profile = "([^"]+)"', block)
        members = re.findall(r'\{ name = "([^"]+)", version = "', block)
        out[path.stem] = {
            "kind": kind.group(1) if kind else "",
            "profile": profile.group(1) if profile else "",
            "members": members,
        }
    return out


def _is_no_boot(path: str) -> bool:
    return (path.startswith(NO_BOOT_PREFIXES)
            or path in NO_BOOT_EXACT
            or path.endswith(".md"))


PKG_RE = re.compile(r"^pkgs/[^/]+/([^/]+)\.lua$")


def classify(paths) -> tuple:
    """(changed package names, full?, reason). A full run wins outright."""
    changed, reasons = set(), []
    for p in paths:
        p = p.strip()
        if not p:
            continue
        m = PKG_RE.match(p)
        if m:
            changed.add(m.group(1))
            continue
        if _is_no_boot(p):
            continue
        # Unrecognised, or infrastructure every descriptor rides on
        # (template.lua, pkgindex-build.lua, tools/, tests/, .github/).
        reasons.append(p)
    if reasons:
        return set(), True, f"{reasons[0]} (and {len(reasons) - 1} more)" \
            if len(reasons) > 1 else reasons[0]
    return changed, False, ""


def unit(name: str, known: dict) -> dict:
    """One matrix entry: what to install, and how to boot it.

    `install` is the package list the workflow hands to xlings, in order. A
    lone plugin whose surface is itself an index package (the TUI ones) needs
    that surface installed first or it has nothing to attach to.
    """
    d = known[name]
    composite = d["kind"] in COMPOSITE_KINDS
    install = [name]
    if not composite:
        surface = SURFACE_FOR_PROFILE.get(d["profile"], "")
        pkg = SURFACE_PACKAGE.get(surface)
        if pkg and pkg != name:
            install.insert(0, pkg)
    return {"name": name, "kind": d["kind"], "composite": composite,
            "install": " ".join(install)}


def affected(paths, known: dict, full: bool = False) -> dict:
    """The whole decision, as data. Pure -- tests call this directly."""
    changed, forced, why = classify(paths)
    full = full or forced
    if full:
        # Every composite, which is a superset of what the gate booted before.
        # Not every plugin: 70 lone boots is a new cost this change never
        # promised, and the composites already cover the shape of the append
        # that template.lua performs.
        names = sorted(n for n, d in known.items() if d["kind"] in COMPOSITE_KINDS)
        reason = f"full run ({why})" if why else "full run (forced)"
    else:
        names = set()
        for c in changed:
            if c not in known:
                continue          # a descriptor the change deleted
            names.add(c)
            for other, d in known.items():
                if c in d["members"]:
                    names.add(other)
        names = sorted(names)
        reason = (f"{len(changed)} descriptor(s) changed -> {len(names)} unit(s)"
                  if changed else "nothing that can affect a boot")
    units = [unit(n, known) for n in names]
    return {"units": units, "any": bool(units), "full": full, "reason": reason}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--files", required=True,
                    help="file holding one changed path per line, or - for stdin")
    ap.add_argument("--full", action="store_true",
                    help="force every composite (main, schedule, ci:full)")
    ap.add_argument("--github-output", action="store_true")
    args = ap.parse_args()

    raw = sys.stdin.read() if args.files == "-" else \
        pathlib.Path(args.files).read_text(encoding="utf-8")
    result = affected(raw.splitlines(), descriptors(), full=args.full)

    print(f"{result['reason']}", file=sys.stderr)
    for u in result["units"]:
        print(f"  boot {u['name']:<24} kind={u['kind']:<8} install={u['install']}",
              file=sys.stderr)

    out = os.environ.get("GITHUB_OUTPUT")
    if args.github_output and out:
        with open(out, "a", encoding="utf-8") as fh:
            fh.write(f"units={json.dumps(result['units'])}\n")
            fh.write(f"any={str(result['any']).lower()}\n")
            fh.write(f"full={str(result['full']).lower()}\n")
            fh.write(f"reason={result['reason']}\n")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
