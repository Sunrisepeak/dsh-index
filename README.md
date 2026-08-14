# dsh-index

English | [中文](README.zh.md)

**Agent = Harness + Plugins/Packages.** This index browses, and distributes,
both — the plugins of the [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness)
ecosystem, and complete Agents assembled from them.

Browse everything at **<https://sunrisepeak.github.io/dsh-index>**.

## What this is

**1 · A browser for the ecosystem.** Every dsh plugin worth installing, searchable,
with what it does, where its bytes come from, and how the ecosystem has grown
over time.

**2 · One command to install, two ways to run it.** dsh installs plugins itself,
so every plugin page leads with its native command. This index's command sits
below it and adds what dsh cannot: a sha256-checked tarball and a CN mirror.

**3 · A distribution channel for Agents.** `Agent = Harness + Plugins/Packages`
— in dsh's own model, a *profile*. Here each one is a single xpkg descriptor, so
`xlings install` resolves the members, installs them, writes the profile, and
**registers a command named after the package**. One install, one word to type:

```bash
xlings install dsh:agent-web-coding -y   →   agent-web-coding
```

The profile name is the package name too, so `dsh --profile agent-web-coding`
is the same thing spelled the long way.

## Quick start

```bash
xlings install dsh -y
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git

xlings install dsh:agent-web-coding -y   # a complete Agent
agent-web-coding                         # run it — the package name IS the command
```

That last line is not a typo. **Installing an Agent leaves you a command named
after it**, registered through xlings' `xvm` as an alias onto
`dsh --profile agent-web-coding`. Because the name is xvm's, it is versioned
and scoped per subos for free:

```bash
xlings install dsh:agent-web-coding@0.2.0 -y
xlings use agent-web-coding 0.1.0        # switch, in this subos only
```

`dsh --profile agent-web-coding` keeps working — the command is an alias, not
a replacement.

<details>
<summary>Don't have xlings yet? Click for the install command</summary>

**Linux / macOS**
```bash
curl -fsSL https://d2learn.org/xlings-install.sh | bash
```

**Windows — PowerShell**
```powershell
irm https://d2learn.org/xlings-install.ps1.txt | iex
```

> More about xlings → [xlings.d2learn.org](https://xlings.d2learn.org)

</details>

## Three tiers

| tier | what it is | installing it |
| --- | --- | --- |
| **plugin** | one upstream bundle — an atom | downloads and pins the bytes, and prints the one line that composes it |
| **group** | a reusable set that composes cleanly | installs every member |
| **Agent** | `Harness + Plugins` + this Agent's own config layer | creates its profile, composes everything into it, and registers a command named after the package |

A group and an Agent carry no bytes of their own. They are manifests a few
hundred bytes long; the members hold the payload. Members are required to be
mirrored, because a curated set whose contents fetch from upstream at boot
would inherit every failure mode the mirror exists to remove.

<details>
<summary>Why an Agent has to be a package, and not just a YAML file</summary>

dsh composes a profile from four patch layers, and you can hand it another one
at boot:

```bash
dsh --profile agent-web-coding --patch ./extra.yml
```

But a patch carries configuration only — **no dependency declarations** — and
dsh's boot path never invokes a package manager. Point it at a patch naming a
plugin you do not have and it exits:

```
Error: dsh: plugin tree failed to load: failed to apply loader entry include
```

The profile's `package.json` is what carries dependencies, and that is what
`pnpm install` reads. So distributing an Agent needs something that installs —
which is precisely what an xpkg's `deps` closure already is.

</details>

## Installing

Every plugin page shows both commands. They are not equivalent:

```bash
# dsh's own — works anywhere dsh is installed, goes straight to the source
dsh plugin --profile web add dsh-cc-tui@0.1.6

# this index — sha256-checked, CN-mirrored where the licence allows it
xlings install dsh:dsh-cc-tui -y
```

The native spec differs per package and is resolved when the site is built,
never guessed: a bundle npm actually serves at our pinned version installs by
name, and everything else installs from its pinned commit. Today that is 17
by name and 51 by commit — a bare `bundle_name` is the package's own
`package.json` name and does not imply publication.

<details>
<summary>All the commands you need — install, switch, remove</summary>

```bash
# add this index (namespace: dsh)
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git

# search and inspect
xlings search dsh:tui
xlings list dsh:dsh-cc-tui

# install
xlings install dsh:agent-web-coding -y      # an Agent
xlings install dsh:group-web-essentials -y  # a group
xlings install dsh:dsh-cc-tui -y            # one plugin
xlings install dsh:dsh-cc-tui@0.1.6 -y      # a specific version

# change the profile named in the line a plugin prints
XIM_DSH_PROFILE=work xlings install dsh:dsh-at-file -y

# switch versions per subos — for an Agent this switches which one its
# command resolves to, so two versions can be installed at once
xlings use agent-web-coding 0.1.0

# remove
xlings remove dsh:dsh-cc-tui -y
```

`XIM_DSH_PROFILE` is this index's variable, deliberately not spelled
`DSH_PROFILE`: dsh reads no such variable — only `DSH_HOME`, `DSH_WEB_URL`
and `DSH_TELEMETRY_DISABLED` — so using that name would claim an upstream
contract that does not exist.

</details>

<details>
<summary>Where did my plugin go? (and how to launch it)</summary>

Installing prints the answer, but the rule is:

**Installing a plugin does not put it in a profile.** Fetching and composing
are separate acts with separate owners, so the atom fetches and prints the one
line that composes it:

```
dsh-at-file is downloaded and pinned. It is not in any profile yet.
  Add it:     dsh plugin --profile web add /…/dsh-at-file-0.1.0.tgz
  Launch it:  dsh web
```

While the atom registered itself, installing one Agent also put its five
members in `web`, because each member had already decided where it belonged
before the Agent ran.

| What you installed | Profile | Launch |
| --- | --- | --- |
| an Agent | its own package name — composed for you | `dsh --profile <package-name>` |
| a group | none; its members are fetched, not composed | — |
| one plugin | none until you paste the printed line | `dsh web`, or `dsh --profile <name>` |

The profile in that printed line is the one the plugin's own README documents
(65 say `web`, 2 say `tui`, 1 says `cc-tui`) — this index does not invent
names, and any name works. An Agent uses its own package name, so
`xlings install dsh:X` is always followed by `dsh --profile X`; two names for
one thing would leave a reader no way to know they are related.

```bash
# what is actually installed, and in what order the layers apply
cat ~/.dsh/profiles/<profile>/package.json
dsh --profile <profile> --dump-config | grep '^# == '
```

</details>

## Mirrored vs direct

Every plugin is one of two kinds, and the site labels which:

| | mirrored | direct |
|---|---|---|
| bytes come from | xlings-res, sha256-checked | GitHub, at a pinned commit |
| CN mirror | yes | no |
| upstream deletes the repo | still installable | gone |
| ships a `prepare` script | built in this index's CI | pnpm blocks it until you allow it |

**The licence decides**, not a preference: mirroring is redistribution. Of the
169 bundles surveyed across the `dsh-plugin` topic, 29 ship no LICENSE at all
and 13 more are unclassifiable — this index has no right to mirror those, so
they stay direct and say so.

## Defining an Agent

This is the contribution that matters most here: **compose plugins that already
exist into something someone can run.** An Agent is a manifest — a few hundred
bytes naming its members, with no payload of its own.

Agents and groups are generated, so edit the source and never the descriptor;
CI re-runs the expansion, so the two cannot drift.

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

Three rules, and all three are refusals rather than warnings, because here the
**index** chooses the combination:

| Rule | Why |
|---|---|
| the profile name is the package name | `xlings install dsh:X` must be followed by `dsh --profile X` |
| every member must be mirrored | a curated set whose contents fetch from upstream at boot is not reproducible |
| no two members may replace the same `dsh-base` row | a patch replaces a row whole, so the later member silently wins |

Members are pinned to a version and a commit, so an Agent names one fixed set
of bytes.

## Adding a plugin

Let the scanner collect the facts — it pins the head sha first and reads
`package.json` **at that sha**:

```bash
tools/discover.py --new --json /tmp/new.json
tools/sync.py --new /tmp/new.json
```

Descriptors under `pkgs/<letter>/<name>.lua` are **data only** — no hooks, no
`xpm`, no `type`. All lifecycle comes from `template.lua`, appended to every
descriptor at index-build time by `pkgindex-build.lua`.

```lua
package = {
    spec = "1",
    name = "dsh-cc-tui",
    description = "Claude Code style full-screen terminal UI",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},

    dsh = {
        kind = "plugin",                -- plugin | group | profile
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

## Working on this with an agent

The authoring rules are written as skills, so hand your agent the path and it
has the whole contract — field-by-field rules, both Lua runtimes and the gaps
that fail silently in each, and the PR requirements.

```
Read https://github.com/Sunrisepeak/dsh-index — an xlings package index that
distributes DeepSeek Harness Agents, where Agent = Harness + Plugins. Before
changing anything, read .agents/skills/xpkg-creater/SKILL.md for the package
authoring contract and .agents/skills/pr-workflow/SKILL.md for how changes
land. Design rationale is in .agents/docs/. Then <what you want>.
```

| Skill | Covers |
|---|---|
| [`xpkg-creater`](.agents/skills/xpkg-creater/SKILL.md) | the three tiers, every `dsh.*` field, the two Lua runtimes and what is nil in each, isolation limits, acceptance |
| [`pr-workflow`](.agents/skills/pr-workflow/SKILL.md) | branch, PR body, the checks that must be green, merge rules |

See [docs/contributing.md](docs/contributing.md) for the short path.

## Staying current

`tools/discover.py` scans the `dsh-plugin` topic and answers three separate
questions, each of which becomes its own PR:

```bash
tools/discover.py --new     # repos the index does not carry yet
tools/discover.py --bump    # carried packages whose upstream released
tools/discover.py --audit   # carried packages whose pinned commit is GONE
```

`--audit` never auto-merges. A pinned sha disappearing means a force push or a
deleted repo, and following it silently would break the one promise the pin
makes.

## Checks

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .   # index-build regression gate
git checkout -- pkgs/                        # the harness appends; undo it
pytest -q                                    # descriptor schema and policy
tools/gen_agents.py --check                  # composites match their source
```

The sandbox gate is not optional. xlings runs `pkgindex-build.lua` in
libxpkg's minimal plain-Lua sandbox where `cprintf` / `try` / `raise` are all
nil; one of them slipping in makes the built index **silently lose every xpm
section**, and installs break for everyone on the artifact path.

## Links

- [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) · [plugin docs](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/user/develop/basic/publish.md)
- [`dsh-plugin` topic](https://github.com/topics/dsh-plugin) — upstream's discovery entry point
- [xim-pkgindex](https://github.com/openxlings/xim-pkgindex) — the official xlings index (`xim:dsh` lives there)
- [awesome-dsh-plugins](https://github.com/AdamPlatin123/awesome-dsh-plugins) — ecosystem compatibility reports

## License

Apache-2.0. Each indexed plugin keeps its own license; this repository
redistributes only those whose license permits it.
