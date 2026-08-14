#!/usr/bin/env python3
"""Read each plugin's own README for the profile name it documents.

There is no field anywhere that declares a plugin's profile: upstream's model
says the name belongs to the user, and its docs use `demo` the way
dsh-cc-tui's README uses `cc-tui` -- examples, not declarations. So if this
index is going to pick a default at all, the least surprising one is the name
the plugin's own documentation tells its readers to type.

Measured across the index: 53 of 68 READMEs say `web`, 3 name something else,
4 print the placeholder `your-profile`, and 8 say nothing. Only the 3 need
recording; everything else is `web`, which is what `dsh web` boots anyway.

Usage: tools/mine_profiles.py            # report
       tools/mine_profiles.py --write    # write dsh.profile into descriptors
"""
from __future__ import annotations

import base64
import json
import pathlib
import re
import subprocess
import sys

# Names that appear in a README as a stand-in for "pick your own", not as a
# name the author is telling you to use.
PLACEHOLDERS = {"your-profile", "my-profile", "name", "profile", "demo",
                "example", "yourprofile", "profile-name"}
READMES = ("README.md", "README.zh.md", "README.en.md", "README.zh-CN.md")


def documented_profile(repo: str) -> str:
    for rd in READMES:
        r = subprocess.run(["gh", "api", f"repos/{repo}/contents/{rd}",
                            "--jq", ".content"], capture_output=True, text=True)
        if r.returncode != 0 or not r.stdout.strip():
            continue
        try:
            body = base64.b64decode(r.stdout).decode("utf-8", "replace")
        except Exception:
            continue
        names = [n for n in re.findall(r"--profile\s+([A-Za-z0-9_-]+)", body)
                 if n.lower() not in PLACEHOLDERS]
        if names:
            # Most frequent wins; a README that shows one name repeatedly means
            # it more than one that mentions another once.
            return max(set(names), key=names.count)
    return ""


def main() -> int:
    write = "--write" in sys.argv
    report = []
    for f in sorted(pathlib.Path("pkgs").rglob("*.lua")):
        body = f.read_text(encoding="utf-8")
        repo = re.search(r'repo = "https://github.com/([^"]+)"', body).group(1)
        name = documented_profile(repo)
        report.append({"pkg": f.stem, "repo": repo, "profile": name or "web"})
        # `web` is the fallback, so recording it would be noise in 53 files.
        if write and name and name != "web" and "profile = " not in body:
            anchor = "        needs_build = "
            i = body.index(anchor)
            ins = (f'        -- Profile this plugin\'s own README tells readers to use.\n'
                   f'        profile = "{name}",\n')
            f.write_text(body[:i] + ins + body[i:], encoding="utf-8")
            print(f"  {f.stem}: profile = {name}")
    pathlib.Path("tools/profiles.json").write_text(
        json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    custom = [r for r in report if r["profile"] != "web"]
    print(f"\n{len(report)} plugins; {len(custom)} document a profile other than web:")
    for r in custom:
        print(f"   {r['pkg']:<24} {r['profile']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
