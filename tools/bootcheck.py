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
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
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


def tarball(name: str, version: str) -> str:
    home = os.environ.get("XLINGS_HOME") or os.path.expanduser("~/.xlings")
    hits = glob.glob(os.path.join(
        home, "data", "xpkgs", f"dsh-x-{name}", version, f"{name}-{version}.tgz"))
    if not hits:
        raise SystemExit(
            f"{name}@{version}: no installed tarball. Install it first:\n"
            f"  xlings install dsh:{name}@{version} -y")
    return hits[0]


def boot(name: str, version: str, dsh_home: str) -> str:
    """"" on success, else the reason."""
    profile = f"bootcheck-{name}"
    env = dict(os.environ, DSH_HOME=dsh_home)
    add = subprocess.run(
        ["dsh", "plugin", "--profile", profile, "add", tarball(name, version)],
        capture_output=True, text=True, env=env, cwd="/tmp", timeout=600)
    if add.returncode != 0:
        return f"compose failed: {add.stderr.strip().splitlines()[-1:] or add.stdout[-200:]}"
    # Under a pty, not a pipe. A TUI surface refuses to start without one --
    # `cc-tui requires an interactive terminal (stdout must be a TTY)` -- so a
    # piped check reports the whole tier as broken and hides the real failures
    # among the noise.
    out, code = _run_on_pty(["dsh", "--profile", profile], env)
    if code is None:
        return ""          # still running when the timer expired -- it booted
    hit = re.search(r"Cannot find package '[^']+'|failed to import loader entry [^\s:]+"
                    r"|Error: dsh: [^\n]+", out)
    return hit.group(0) if hit else f"exited {code}"


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
                    help="treat each name as a group/Agent and check its members")
    ap.add_argument("names", nargs="+")
    args = ap.parse_args()

    targets = []
    for n in args.names:
        targets += members_of(n) if args.composite else [
            (n, re.search(r'latest = "([^"]+)"', descriptor(n)).group(1))]

    home = tempfile.mkdtemp(prefix="bootcheck-dsh-")
    bad = []
    for name, version in dict.fromkeys(targets):
        why = boot(name, version, home)
        print(f"  {name}@{version:<12} {why or 'OK'}", flush=True)
        if why:
            bad.append((name, version, why))

    if bad:
        print(f"\n{len(bad)} package(s) cannot boot:", file=sys.stderr)
        for name, version, why in bad:
            print(f"  {name}@{version}: {why}", file=sys.stderr)
        return 1
    print(f"\n{len(targets)} package(s) booted")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
