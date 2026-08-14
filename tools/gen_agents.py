#!/usr/bin/env python3
"""Generate the group and Agent descriptors from tools/agents.json.

A group and an Agent are manifests: a few hundred bytes naming members, with
no payload of their own (design section 2.4). What makes them worth generating
rather than hand-writing is the member list -- an Agent that reuses a group
must carry that group's plugins in its own flat `members`, because
template.lua composes at install time and cannot read another descriptor.
Expanding it here and re-checking it in CI is what keeps the copy honest.

Two rules are enforced, and both are refusals rather than warnings:

  members must be mirrored     a group or an Agent is this index's reproducible
                               unit; one whose members fetch from upstream at
                               boot inherits every failure mode it exists to
                               remove -- no CN mirror, no checksum, gone if the
                               repo is deleted -- while looking curated.

  members must not collide     two members replacing the same dsh-base row do
                               not merge; the later one silently wins. That is
                               a broken combination, and the index is the one
                               choosing it, so it must not ship (design 3).

Usage: tools/gen_agents.py [--check]
"""
from __future__ import annotations

import json
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from discover import newer  # noqa: E402

ROOT = pathlib.Path(__file__).resolve().parent.parent
PKGS = ROOT / "pkgs"

HEADER = """package = {{
    spec = "1",

    name = {name},
    description = {desc},
    repo = "https://github.com/Sunrisepeak/dsh-index",
    homepage = "https://sunrisepeak.github.io/dsh-index",
    licenses = {{"Apache-2.0"}},
    authors = {{"Sunrisepeak"}},

    status = "dev",
    categories = {{{categories}}},
    keywords = {{{keywords}}},

    dsh = {{
        kind = {kind},
{body}    }},
}}
"""


def lua_str(s: str) -> str:
    return '"' + str(s).replace("\\", "\\\\").replace('"', '\\"') + '"'


def lua_list(items) -> str:
    return ", ".join(lua_str(i) for i in items)


def read_member(name: str) -> dict:
    """The facts a group or Agent needs about one member, from its descriptor."""
    hits = list(PKGS.rglob(f"{name}.lua"))
    if not hits:
        raise SystemExit(f"member '{name}' has no descriptor")
    body = hits[0].read_text(encoding="utf-8")
    ov = re.search(r"overrides = \{([^}]*)\}", body)
    bundle = re.search(r'bundle_name = "([^"]+)"', body)
    if not bundle:
        raise SystemExit(f"member '{name}' declares no bundle_name")

    # The newest MIRRORED version, which is not always the newest version.
    # Mirroring lags upstream by however long tools/mirror.py takes to publish
    # -- dsh-cc-tui reached 0.3.3 while 0.1.6 was still the only tarball -- and
    # pinning `latest` there gave the Agent a member with no tarball to
    # compose. The package-level "is it mirrored" check passed, because that
    # question is per VERSION and it was being asked per package.
    mirrored = set()
    mblock = re.search(r"mirror = \{(.*?)\n        \}", body, re.S)
    if mblock:
        mirrored = set(re.findall(r'\["([^"]+)"\]\s*=\s*\{', mblock.group(1)))
    best = None
    for v in mirrored:
        if best is None or newer(v, best) is True:
            best = v
    if best is None:
        raise SystemExit(
            f"member '{name}' has no mirrored version. A group or an Agent is "
            f"this index's reproducible unit; run tools/mirror.py first.")
    commit = re.search(rf'\["{re.escape(best)}"\]\s*=\s*'
                       r'\{[^}]*commit = "([0-9a-f]{40})"', body)
    return {
        "name": name,
        # The name the profile manifest records, which is what `dsh plugin
        # remove` matches on. It is often not the descriptor name -- the
        # `dsh-annotation` package is `@omdsh-dev/dsh-annotation` in the
        # manifest -- and an uninstall that passed the descriptor name got
        # ERR_PNPM_CANNOT_REMOVE_MISSING_DEPS halfway through, leaving the
        # profile partly dismantled.
        "bundle": bundle.group(1),
        # Pinned, not floating. Without a version the Agent composes whatever
        # `latest` happens to be that day, so "Agent 0.1.0" would name a
        # different set of bytes each time a member released.
        "version": best,
        "commit": commit.group(1) if commit else "",
        "overrides": re.findall(r'"([^"]+)"', ov.group(1)) if ov else [],
    }


def check_members(owner: str, names: list) -> list:
    facts = [read_member(n) for n in names]

    seen = {}
    for f in facts:
        for row in f["overrides"]:
            if row in seen:
                raise SystemExit(
                    f"{owner}: '{f['name']}' and '{seen[row]}' both replace the "
                    f"dsh-base row '{row}'. A patch replaces a row's whole "
                    f"config, so the later member silently wins -- this "
                    f"combination cannot ship.")
            seen[row] = f["name"]
    return facts


def descriptor(spec: dict, kind: str, facts: list) -> str:
    lines = []
    if kind == "profile":
        if not spec.get("surface"):
            raise SystemExit(
                f"{spec['name']}: an Agent must declare a surface. Without one "
                f"it boots into a profile with no UI and every plugin that "
                f"attaches to one waits forever.")
        lines.append(f'        -- The UI this Agent boots into. It ships inside dsh\n')
        lines.append(f'        -- itself, so it is a bundle name and not a dependency.\n')
        lines.append(f'        surface = {lua_str(spec["surface"])},\n')
        # The profile name IS the package name. `xlings install dsh:X` followed
        # by `dsh --profile Y` gives the reader two names for one thing and no
        # way to know they are related; upstream's own docs are the only thing
        # that can license a different name, and these Agents are ours.
        lines.append(f'        profile = {lua_str(spec["name"])},\n')
    lines.append("\n")
    lines.append("        -- Expanded by tools/gen_agents.py; template.lua composes\n")
    lines.append("        -- these at install time and cannot read another descriptor,\n")
    lines.append("        -- so the list is flat rather than a reference. `bundle` is\n")
    lines.append("        -- the name the profile manifest records, which is what\n")
    lines.append("        -- `dsh plugin remove` matches on, and `version` pins the\n")
    lines.append("        -- member so this Agent means one fixed set of bytes.\n")
    lines.append("        members = {\n")
    for f in facts:
        lines.append(f'            {{ name = {lua_str(f["name"])}, '
                     f'version = {lua_str(f["version"])}, '
                     f'bundle = {lua_str(f["bundle"])}, '
                     f'commit = {lua_str(f["commit"])} }},\n')
    lines.append("        },\n\n")
    if spec.get("groups"):
        lines.append("        -- Provenance for the expansion above.\n")
        lines.append(f'        groups = {{{lua_list(spec["groups"])}}},\n\n')
    lines.append(f'        versions = {{ [{lua_str(spec["version"])}] = {{}} }},\n')
    lines.append(f'        latest = {lua_str(spec["version"])},\n\n')
    lines.append("        needs_build = false,\n")

    cats = ["dsh-agent" if kind == "profile" else "dsh-group"]
    return HEADER.format(
        name=lua_str(spec["name"]),
        desc=lua_str(spec["description"]["en"]),
        kind=lua_str(kind),
        categories=lua_list(cats),
        keywords=lua_list(["dsh"] + (["agent", "profile"] if kind == "profile"
                                     else ["group"])),
        body="".join(lines),
    )


def main() -> int:
    check = "--check" in sys.argv
    src = json.loads((ROOT / "tools" / "agents.json").read_text(encoding="utf-8"))
    by_group = {g["name"]: g["members"] for g in src["groups"]}

    written, stale = 0, []
    for spec, kind in ([(g, "group") for g in src["groups"]]
                       + [(a, "profile") for a in src["agents"]]):
        if kind == "group":
            members = list(spec["members"])
        else:
            members = []
            for g in spec.get("groups", []):
                if g not in by_group:
                    raise SystemExit(f"{spec['name']}: unknown group '{g}'")
                members += by_group[g]
            members += spec.get("extra", [])
            # An Agent listing a plugin that a group already brings would add
            # it twice; dedupe on the way in rather than letting pnpm do it.
            members = list(dict.fromkeys(members))

        facts = check_members(spec["name"], members)
        text = descriptor(spec, kind, facts)
        path = PKGS / spec["name"][0].lower() / f"{spec['name']}.lua"
        path.parent.mkdir(parents=True, exist_ok=True)
        if check:
            if not path.exists() or path.read_text(encoding="utf-8") != text:
                stale.append(str(path.relative_to(ROOT)))
            continue
        path.write_text(text, encoding="utf-8")
        written += 1

    if stale:
        print("out of date, re-run tools/gen_agents.py: " + ", ".join(stale),
              file=sys.stderr)
        return 1
    print(f"{'checked' if check else 'wrote'} "
          f"{len(src['groups'])} groups and {len(src['agents'])} Agents")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
