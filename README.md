# dsh-index

English | [中文](README.zh.md)

An [xlings](https://github.com/openxlings/xlings) package index for the
**DeepSeek Harness** plugin ecosystem. Namespace: `dsh`.

## Install

```bash
xlings install dsh pnpm -y
xim --add-indexrepo dsh:https://github.com/Sunrisepeak/dsh-index.git
xlings install dsh:dsh-cc-tui -y
```

`pnpm` is required: `dsh plugin` is a pnpm forwarder, and upstream states that
profile installation needs pnpm on `PATH`.

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
        source = "github",
        origin = "ccch1mneyyy/dsh-cc-tui",
        versions = { ["0.1.2"] = { ref = "<40-hex commit sha>" } },
        latest = "0.1.2",
        needs_build = false,
        license = "BSD-3-Clause",
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
