# dsh-index

English | [中文](README.zh.md)

An [xlings](https://github.com/openxlings/xlings) package index for the
**DeepSeek Harness** plugin ecosystem. Namespace: `dsh`.

## Install

**Install via xlings** (recommended)

```bash
xlings install dsh -y
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git
xlings install dsh:dsh-cc-tui -y
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

<details>
<summary>All the commands you need — install, switch, remove</summary>

```bash
# add this index (namespace: dsh)
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git

# search and inspect
xlings search dsh:tui
xlings list dsh:dsh-cc-tui

# install
xlings install dsh:dsh-cc-tui -y            # latest
xlings install dsh:dsh-cc-tui@0.1.6 -y      # a specific version

# choose the profile it lands in
DSH_PROFILE=work xlings install dsh:dsh-at-file -y

# a plugin that ships a build script AND is not mirrored needs this,
# because installing it runs upstream code on your machine
DSH_ALLOW_BUILDS=1 xlings install dsh:<plugin> -y

# switch versions per subos
xlings use dsh-cc-tui 0.1.6

# remove — takes the plugin out of the profile too
xlings remove dsh:dsh-cc-tui -y
```

</details>

<details>
<summary>Where did my plugin go? (and how to launch it)</summary>

Installing prints the answer, but the rule is:

| How you installed it | Profile | Launch |
| --- | --- | --- |
| `xlings install dsh:<plugin>` | `web` | `dsh web` |
| `DSH_PROFILE=<name> xlings install …` | `<name>` | `dsh --profile <name>` |

This index does not name profiles — upstream's model says the name is yours,
and `DSH_PROFILE` is the same choice `dsh plugin --profile` gives you. Two
plugins that both override base rows will conflict in one profile, exactly as
they do upstream; put them in separate profiles if that happens.

```bash
# what is actually installed, and in what order the layers apply
cat ~/.dsh/profiles/<profile>/package.json
dsh --profile <profile> --dump-config | grep '^# == '
```

</details>

Plugins install into the `web` profile — the one upstream's own `dsh web`
boots. Launch it the way upstream does:

```bash
dsh web
```

To use any other profile, name it exactly as you would with `dsh plugin`:

```bash
DSH_PROFILE=cc-tui xlings install dsh:dsh-cc-tui -y
dsh --profile cc-tui
```

The profile name is yours, not the plugin's. `DSH_PROFILE` maps one-to-one
onto upstream's `--profile`, so every example in upstream's docs works here
unchanged.

pnpm arrives as a dependency of `dsh` — `dsh plugin` is a pnpm forwarder and
upstream requires pnpm on `PATH`, so it belongs in the package that needs it
rather than in every install command.

Browse everything at **<https://sunrisepeak.github.io/dsh-index>**.

## What a plugin here is

A dsh plugin is a **profile bundle** — an npm package declaring
`"dsh": { "bundle": { "patch": "./cordis.patch.yml" } }`. Installing one adds a
dependency to `$DSH_HOME/profiles/<name>` and appends a layer to
`dsh.profile.bundles`; dsh composes those layers in order at boot.

This is upstream's only external-plugin path. The older `.dsh-plugin` /
`repository-plugins` format was removed from mainline on 2026-08-09.

The profile defaults to the current subos, so entering a different subos gives
a different plugin set. Override with `DSH_PROFILE`.

## Mirrored vs direct

Every package is one of two kinds, and the site labels which:

| | mirrored | direct |
|---|---|---|
| bytes come from | xlings-res, sha256-checked | GitHub, at a pinned commit |
| CN mirror | yes | no |
| upstream deletes the repo | still installable | gone |
| ships a `prepare` script | built in this index's CI | needs `DSH_ALLOW_BUILDS=1` |

**The license decides**, not a preference: mirroring is redistribution. Of the
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
        bundle_name = "dsh-cc-tui",
        versions = { ["0.1.2"] = { commit = "<40-hex sha>" } },
        latest = "0.1.2",
        needs_build = false,
    },
}
```

Always pin a 40-hex commit. Package names are not trustworthy here: 36
community repos name themselves into the `@deepseek-ai/` scope that DeepSeek
actually owns on npm, so a bare name can silently resolve to different code.

See [docs/contributing.md](docs/contributing.md).

## Checks

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .   # index-build regression gate
git checkout -- pkgs/                        # the harness appends; undo it
pytest -q                                    # descriptor schema and policy
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
