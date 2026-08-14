#!/usr/bin/env python3
"""Boot a package in a throwaway profile and report whether it actually runs.

This exists because `--dump-config` looked like proof and was not. It composes
the layers without importing any of them, so a profile whose plugin cannot be
imported dumps six clean layers and then dies on boot. An Agent shipped that
way: `dsh-turn-rewind` imports `cordis` but declares it only as a
peerDependency, and dsh writes `autoInstallPeers: false` into every profile it
scaffolds, so nothing provides it. Every member's tarball was present, the
profile manifest listed all five, the dump was correct -- and
`agent-web-coding` exited with ERR_MODULE_NOT_FOUND.

So this boots for real. A boot that stays alive is a pass: the surfaces here
are servers and TUIs that never exit on their own, while a failure to import
is immediate and prints its reason.

Usage: tools/bootcheck.py <name>...        # names of mirrored plugins
       tools/bootcheck.py --composite <name>   # every member of a group/Agent
"""
from __future__ import annotations

import argparse
import glob
import json
import os
import pathlib
import pty
import selectors
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parent.parent


def dsh_bin() -> str:
    """Where the `dsh` shim actually is.

    xvm puts shims under `$XLINGS_HOME/subos/<name>/bin`, not in
    `$XLINGS_HOME/bin` -- that one holds xlings itself. A PATH carrying only
    the latter looks right and fails with a bare FileNotFoundError from
    subprocess, which says nothing about why.
    """
    found = shutil.which("dsh")
    if found:
        return found
    for cand in sorted(glob.glob(os.path.join(_home(), "subos", "*", "bin", "dsh"))):
        if os.access(cand, os.X_OK):
            return cand
    raise SystemExit(
        "dsh is not on PATH and no shim was found under "
        f"{_home()}/subos/*/bin. Install it with `xlings install dsh -y` and put "
        f"that directory on PATH.")


DSH = None
# Long enough for node to import the whole tree on a cold cache; an import
# failure lands in well under a second, so this only ever costs time on a pass.
BOOT_SECONDS = 40


def descriptor(name: str) -> str:
    hits = list((ROOT / "pkgs").rglob(f"{name}.lua"))
    if not hits:
        raise SystemExit(f"{name}: no descriptor")
    return hits[0].read_text(encoding="utf-8")


def members_of(name: str) -> list:
    body = descriptor(name)
    m = re.search(r"members = \{(.*?)\n        \}", body, re.S)
    if not m:
        raise SystemExit(f"{name}: not a composite")
    return re.findall(r'name = "([^"]+)", version = "([^"]+)"', m.group(1))


def surface_of(name: str) -> str:
    m = re.search(r'surface = "([^"]+)"', descriptor(name))
    return m.group(1) if m else ""


def declare_surface(manifest: str, surface: str) -> None:
    """Put the surface bundle after dsh-base, the way template.lua does."""
    d = json.load(open(manifest))
    bundles = d["dsh"]["profile"]["bundles"]
    if surface and surface not in bundles:
        bundles.insert(bundles.index("@deepseek-ai/dsh-base") + 1, surface)
        json.dump(d, open(manifest, "w"), indent=2)


XLINGS_HOME = ""


def _home() -> str:
    return (XLINGS_HOME or os.environ.get("XLINGS_HOME")
            or os.path.expanduser("~/.xlings"))


def tarball(name: str, version: str) -> str:
    home = _home()
    hits = glob.glob(os.path.join(
        home, "data", "xpkgs", f"dsh-x-{name}", version, f"{name}-{version}.tgz"))
    if not hits:
        raise SystemExit(
            f"{name}@{version}: no installed tarball. Install it first:\n"
            f"  xlings install dsh:{name}@{version} -y")
    return hits[0]


def boot(profile: str, members: list, surface: str, dsh_home: str) -> str:
    """"" on success, else the reason.

    The unit is the whole composite, not one member at a time. A member is
    allowed to need something its Agent supplies -- `dsh-task-status` waits on
    a `webServer` service and only activates once the profile carries a web
    surface -- so booting members in isolation asks a question this index
    never promised an answer to, and reports working packages as broken.
    """
    env = dict(os.environ, DSH_HOME=dsh_home)
    for name, version in members:
        add = subprocess.run(
            [DSH, "plugin", "--profile", profile, "add", tarball(name, version)],
            capture_output=True, text=True, env=env, cwd="/tmp", timeout=900)
        if add.returncode != 0:
            tail = (add.stderr.strip().splitlines() or [add.stdout[-200:]])[-1]
            return f"compose failed at {name}@{version}: {tail}"
    declare_surface(os.path.join(dsh_home, "profiles", profile, "package.json"),
                    surface)
    # Under a pty, not a pipe. A TUI surface refuses to start without one --
    # `cc-tui requires an interactive terminal (stdout must be a TTY)` -- so a
    # piped check reports the whole tier as broken and hides the real failures
    # among the noise.
    out, code = _run_on_pty([DSH, "--profile", profile], env)
    # Two ways to pass. A web surface runs until it is killed, so outliving
    # the timer is a pass. A TUI with nobody at the keyboard reads EOF and
    # exits cleanly, so a zero exit is one too -- it started, imported the
    # whole tree, and stopped on its own. Every load failure seen here throws
    # and leaves node with a non-zero status.
    if code is None or code == 0:
        return ""
    # A busy port is this machine's problem, not the package's. Reporting it
    # as a broken Agent sends the reader to the descriptor instead of to the
    # dsh already running in another terminal.
    if "EADDRINUSE" in out:
        port = re.search(r"address already in use ([^\s]+)", out)
        return (f"ENVIRONMENT: {port.group(1) if port else 'a port'} is in use; "
                f"stop the dsh instance holding it and re-run")
    hit = re.search(r"Cannot find package '[^']+'|failed to import loader entry [^\s:]+"
                    r"|Error: dsh: [^\n]+", out)
    return hit.group(0) if hit else f"exited {code}: {out.strip()[-300:]}"


def _run_on_pty(cmd: list, env: dict):
    """(output, exit code). The code is None when it outlived BOOT_SECONDS."""
    parent, child = pty.openpty()
    proc = subprocess.Popen(cmd, stdin=child, stdout=child, stderr=child,
                            env=env, cwd="/tmp", close_fds=True)
    os.close(child)
    chunks, sel = [], selectors.DefaultSelector()
    sel.register(parent, selectors.EVENT_READ)
    try:
        deadline = BOOT_SECONDS
        while deadline > 0:
            for _ in sel.select(timeout=1):
                try:
                    data = os.read(parent, 65536)
                except OSError:
                    data = b""
                if not data:
                    deadline = 0
                    break
                chunks.append(data)
            if proc.poll() is not None:
                break
            deadline -= 1
    finally:
        sel.close()
        os.close(parent)
        if proc.poll() is None:
            proc.kill()
            proc.wait(timeout=10)
            return b"".join(chunks).decode("utf-8", "replace"), None
    return b"".join(chunks).decode("utf-8", "replace"), proc.returncode


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--composite", action="store_true",
                    help="treat each name as a group/Agent and boot it whole")
    ap.add_argument("--xlings-home", default="",
                    help="where packages are installed; defaults to "
                         "$XLINGS_HOME, then ~/.xlings. Explicit because a "
                         "shell that re-exports XLINGS_HOME silently sends "
                         "this at the wrong store.")
    ap.add_argument("names", nargs="+")
    args = ap.parse_args()

    global DSH, XLINGS_HOME
    XLINGS_HOME = args.xlings_home
    DSH = dsh_bin()

    jobs = []
    for n in args.names:
        if args.composite:
            jobs.append((n, members_of(n), surface_of(n)))
        else:
            v = re.search(r'latest = "([^"]+)"', descriptor(n)).group(1)
            jobs.append((n, [(n, v)], ""))

    home = tempfile.mkdtemp(prefix="bootcheck-dsh-")
    bad = []
    for name, members, surface in jobs:
        why = boot(f"bootcheck-{name}", members, surface, home)
        detail = ", ".join(f"{m}@{v}" for m, v in members)
        print(f"  {name:<22} {why or 'OK'}   [{detail}]", flush=True)
        if why:
            bad.append((name, why))

    if bad:
        print(f"\n{len(bad)} cannot boot:", file=sys.stderr)
        for name, why in bad:
            print(f"  {name}: {why}", file=sys.stderr)
        return 1
    print(f"\n{len(jobs)} booted")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
