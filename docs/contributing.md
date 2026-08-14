# Contributing

This index distributes **Agents** — `Agent = Harness + Plugins`. Most
contributions are one of three things, in rough order of how often they come up:

| I want to… | Edit | Then run |
|---|---|---|
| **define an Agent** from plugins already here | `tools/agents.json` | `tools/gen_agents.py` |
| **group** plugins that compose cleanly | `tools/agents.json` | `tools/gen_agents.py` |
| **add a plugin** the index does not carry | `pkgs/<letter>/<name>.lua` | `tools/discover.py --new` finds it for you |

The full authoring rules — every field, both Lua runtimes and their silent
gaps, the isolation constraints — live in the
[`xpkg-creater`](../.agents/skills/xpkg-creater/SKILL.md) skill. This page is
the short path; that one is the contract.

---

## Define an Agent

An Agent is a manifest: a few hundred bytes naming members, with no payload of
its own. It is **generated**, so edit the source and never the descriptor — CI
re-runs the expansion and a hand edit shows up as drift.

```jsonc
// tools/agents.json
"agents": [
  { "name": "agent-web-coding", "version": "0.1.0",
    "description": { "en": "…", "zh": "…" },
    "groups": ["group-web-essentials"],   // expanded into members
    "extra": ["dsh-notification"] }       // plus these plugins
]
```

```bash
tools/gen_agents.py            # write the descriptors
tools/gen_agents.py --check    # what CI runs
```

Installing it creates the profile, composes every member into it, and registers
a command named after the package:

```bash
xlings install dsh:agent-web-coding -y
agent-web-coding
```

### Three rules, all refusals

| Rule | Why |
|---|---|
| **The profile name is the package name** — derived, not a field | `xlings install dsh:X` must be followed by `dsh --profile X`. Two names for one thing leaves a reader no way to know they are related. |
| **Every member must be mirrored** | A group or an Agent is this index's reproducible unit. One whose members fetch from upstream at boot inherits every failure mode the mirror exists to remove, while presenting itself as curated. |
| **No two members may replace the same `dsh-base` row** | A patch replaces a row's whole config rather than merging, so the later member silently wins. At install time that can only be a warning — the user arranged it. Here the index arranged it, so it must not ship. |

Row data comes from `tools/mine_overrides.py`, which intersects each bundle's
own `cordis.patch.yml` with dsh-base's row ids. Measured, not hand-marked:
5 of 68 bundles touch a base row and exactly two pairs collide.

Members are pinned to a version and a commit, so an Agent means one fixed set
of bytes. Without that its deps would resolve to whatever `latest` was that
day.

---

## Add a plugin

Let the scanner do the collecting — it resolves the head sha first and reads
`package.json` **at that sha**, which is what keeps a version key describing
the bytes at its own commit:

```bash
tools/discover.py --new --json /tmp/new.json
tools/sync.py --new /tmp/new.json
```

A descriptor is **data only** — no hooks, no `xpm`, no `type`. All lifecycle
comes from `template.lua`, appended at index-build time by
`pkgindex-build.lua`.

```lua
package = {
    spec = "1",
    name = "dsh-cc-tui",
    description = "Claude Code style full-screen terminal UI",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},

    dsh = {
        kind = "plugin",
        profile = "cc-tui",             -- what its own README tells readers
        bundle_name = "dsh-cc-tui",
        versions = { ["0.1.6"] = { commit = "<40-hex sha>" } },
        latest = "0.1.6",
        needs_build = false,
    },
}
```

Always pin a 40-hex commit. Package names are not trustworthy here: 36
community repos name themselves into the `@deepseek-ai/` scope that DeepSeek
actually owns on npm, so a bare name can silently resolve to different code.

Installing a plugin **does not put it in a profile** — it fetches and pins the
bytes and prints the one line that composes it. Fetching and composing are
separate acts with separate owners; see the skill for why.

### Mirroring is license-gated

A `mirror` block turns a package from *direct* into *mirrored*: CN
acceleration, offline install, and a sha256. **Do not hand-write it.**
`tools/mirror.py` verifies the licence at publish time, builds the tarball in
CI, publishes to both `xlings-res/dsh-plugins` remotes, and only then fills the
block in. If the tag is missing, CI fails closed rather than quietly
downgrading to direct.

---

## Before you open a PR

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .   # run this FIRST
git checkout -- pkgs/                        # the harness appends; undo it
pytest -m "static or isolation" -q
tools/gen_agents.py --check
tools/add_kind.py --check
```

The sandbox gate is not optional. xlings runs `pkgindex-build.lua` in libxpkg's
minimal plain-Lua sandbox where `cprintf` / `try` / `raise` are all nil; one of
them slipping in makes the built index **silently lose every xpm section**.

Then install and uninstall it for real, in an isolated home:

```bash
TMP_X=$(mktemp -d); TMP_D=$(mktemp -d)
XLINGS_HOME=$TMP_X xlings update
XLINGS_HOME=$TMP_X xlings config --index-repo "dsh:$PWD"
XLINGS_HOME=$TMP_X xlings update

XLINGS_HOME=$TMP_X DSH_HOME=$TMP_D xlings install dsh:<name> -y
jq '.dependencies, .dsh.profile.bundles' "$TMP_D/profiles/<name>/package.json"
DSH_HOME=$TMP_D dsh --profile <name> --dump-config | grep '^# == '
XLINGS_HOME=$TMP_X DSH_HOME=$TMP_D xlings remove dsh:<name> -y

rm -rf "$TMP_X" "$TMP_D"
```

Clear any same-name same-version install first — xlings skips the install hook
in that case and still prints success:

```bash
rm -rf ~/.xlings/data/xpkgs/{dsh,local}-x-<name>/<version>
```

PR requirements are in the [`pr-workflow`](../.agents/skills/pr-workflow/SKILL.md)
skill. Include the sandbox gate result and the **actual output** of the install
and uninstall, not "should work".
