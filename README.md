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
`xlings install` resolves the members, installs them, writes the profile, and you
boot it. **An Agent's profile name is its package name**, so what you install and
what you boot are the same word.

## Quick start

```bash
xlings install dsh -y
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git

xlings install dsh:agent-web-coding -y   # a complete Agent
dsh --profile agent-web-coding           # boot it — same name
```

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
| **plugin** | one upstream bundle — an atom | adds it to the profile its own README documents |
| **group** | a reusable set that composes cleanly | installs every member |
| **Agent** | `Harness + Plugins` + this Agent's own config layer | creates its profile and composes everything into it |

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

# choose the profile a plugin lands in
XIM_DSH_PROFILE=work xlings install dsh:dsh-at-file -y

# a plugin that ships a build script AND is not mirrored needs this,
# because installing it runs upstream code on your machine
DSH_ALLOW_BUILDS=1 xlings install dsh:<plugin> -y

# switch versions per subos
xlings use dsh-cc-tui 0.1.6

# remove — takes the plugin out of the profile too
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

| What you installed | Profile | Launch |
| --- | --- | --- |
| an Agent | its own package name | `dsh --profile <package-name>` |
| `xlings install dsh:<plugin>` | the one its own README documents | `dsh web`, or `dsh --profile <name>` |
| `XIM_DSH_PROFILE=<name> xlings install …` | `<name>` | `dsh --profile <name>` |

This index does not invent profile names. Upstream's model says the name is
the user's — `dsh plugin --profile <name>` creates whatever you pass — so a
plugin is recorded with the name its own documentation tells readers to type
(65 say `web`, 2 say `tui`, 1 says `cc-tui`). An Agent uses its own package
name, so `xlings install dsh:X` is always followed by `dsh --profile X` — two
names for one thing would leave a reader no way to know they are related.

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
| ships a `prepare` script | built in this index's CI | needs `DSH_ALLOW_BUILDS=1` |

**The licence decides**, not a preference: mirroring is redistribution. Of the
169 bundles surveyed across the `dsh-plugin` topic, 29 ship no LICENSE at all
and 13 more are unclassifiable — this index has no right to mirror those, so
they stay direct and say so.

## Adding a plugin

Descriptors under `pkgs/<letter>/<name>.lua` are **data only** — no hooks, no
`xpm`, no `type`. All lifecycle comes from `template.lua`, appended to every
descriptor at index-build time by `pkgindex-build.lua`. One paradigm, one
implementation.

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

Groups and Agents are **generated** from `tools/agents.json` by
`tools/gen_agents.py`; edit the source, not the descriptor. CI re-runs the
expansion, so the two cannot drift.

See [docs/contributing.md](docs/contributing.md).

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
