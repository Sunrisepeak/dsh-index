# Adding a plugin

## 0. Is it actually installable?

Check the upstream repo's root `package.json` for a `dsh.bundle` declaration:

```json
{ "dsh": { "bundle": { "patch": "./cordis.patch.yml" } } }
```

Without it, the package still installs but **activates no layer** — `dsh plugin`
prints a warning and nothing happens. That is a library, not a plugin. Don't
index it as one.

## 1. Collect the facts

```bash
REPO=owner/name
BR=$(gh api repos/$REPO --jq .default_branch)

gh api repos/$REPO/commits/$BR --jq .sha              # the 40-hex pin
gh api repos/$REPO --jq '.license.spdx_id // "NONE"'  # mirror eligibility
gh api repos/$REPO/contents/package.json --jq .content | base64 -d \
  | python3 -c 'import json,sys; d=json.load(sys.stdin); print(d["name"], d["version"], (d.get("scripts") or {}).get("prepare"))'
```

Four values decide everything: **sha**, **license**, **package name**, and
whether a `prepare` script exists.

## 2. Write the descriptor

`pkgs/<first-letter>/<name>.lua`, data only. Filename must equal
`package.name`, and the directory must be its first letter.

```lua
package = {
    spec = "1",

    name = "dsh-cc-tui",
    description = "Claude Code style full-screen terminal UI",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    homepage = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},
    authors = {"ccch1mneyyy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin", "tui", "terminal"},

    dsh = {
        kind = "plugin",                -- plugin | group | profile
        profile = "cc-tui",             -- what this plugin's own README
                                        -- tells its readers to type
        bundle_name = "dsh-cc-tui",     -- upstream package.json#name

        versions = {
            ["0.1.2"] = { commit = "4aa91903ed71a2a4ce9050978f4f3e92ec4314e1" },
        },
        latest = "0.1.2",

        needs_build = false,            -- true iff upstream has scripts.prepare

        -- patch = "./dist/cordis.patch.yml",   -- only if not the default
    },
}
```

### Rules that the tests enforce

| Rule | Why |
|---|---|
| `commit` is 40 lowercase hex | A branch or tag can be moved under you. Not spelled `ref`: xpkg already uses that for aliases (`["latest"] = { ref = "2.13.5" }`), and template.lua emits that form into the same file. |
| `bundle_name` is never the install spec | 36 community repos name themselves into `@deepseek-ai/`, a scope DeepSeek owns on npm. A bare name can resolve elsewhere later. |
| `latest` names a declared version | Otherwise `xlings install dsh:<name>` resolves to nothing. |
| `needs_build` is explicit | It gates arbitrary code execution on the user's machine. |
| `licenses` is the standard xpkg field | It is the mirror gate. Absent means upstream declares none, so the gate is fail-closed by construction — no `dsh.license` copy to drift. |
| No hooks / `xpm` / `type` in a descriptor | `template.lua` supplies them; a local copy would be silently overridden. |
| `kind` is declared, and lives in `dsh.*` | xpkg's `type` is a closed enum — libxpkg's `parse_type()` maps any unknown string to `Package`, so `type = "dsh-agent"` would not fail, it would evaporate. |
| `profile` is recorded, not derived | The name belongs to upstream. Every attempt to infer one (from the subos, from the plugin's own name) made upstream's own examples wrong under this index. |

## 2b. Adding a group or an Agent

These are **generated**. Edit `tools/agents.json` and run the generator; do not
hand-edit the descriptor, because CI re-runs the expansion and a hand edit
shows up as drift.

```jsonc
// tools/agents.json
"groups": [
  { "name": "group-web-essentials", "version": "0.1.0",
    "description": { "en": "…", "zh": "…" },
    "members": ["dsh-at-file", "dsh-annotation"] }
],
"agents": [
  { "name": "agent-web-coding", "version": "0.1.0",
    "profile": "coding",                       // the profile it creates
    "description": { "en": "…", "zh": "…" },
    "groups": ["group-web-essentials"],        // expanded into members
    "extra": [] }                              // plus these plugins
]
```

```bash
tools/gen_agents.py            # write the descriptors
tools/gen_agents.py --check    # what CI runs
```

Two rules are refusals, not warnings:

| Rule | Why |
|---|---|
| Every member must be **mirrored** | A group or an Agent is this index's reproducible unit. One whose members fetch from upstream at boot inherits every failure mode the mirror exists to remove — no CN mirror, no checksum, gone if the repo is deleted — while presenting itself as curated. |
| No two members may replace the **same `dsh-base` row** | A patch replaces the targeted row's whole config rather than merging, so the later member silently wins and the earlier author's intent disappears. At install time that can only be a warning — the user arranged it. Here the index arranged it, so it must not ship. |

Row data comes from `tools/mine_overrides.py`, which intersects each bundle's
own `cordis.patch.yml` with `@deepseek-ai/dsh-base`'s row ids. It is measured,
not hand-marked. Today 5 of 68 bundles touch a base row at all, and exactly two
pairs collide.

An Agent may also carry `patch`: the contents of the `cordis.patch.yml` written
into its profile. Of dsh's four patch layers this is the only one that is both
persistent and per-profile — the bundle layer belongs to each plugin's author,
`$DSH_HOME/cordis.patch.yml` is machine-wide, and `--patch` does not persist —
so it is the one place an Agent can state an opinion about its own set.

## 3. Mirroring (optional, license-gated)

A `mirror` block turns a package from *direct* into *mirrored*: CN acceleration,
offline install, survives upstream deletion, and no build authorisation needed.

```lua
        mirror = {
            ["0.1.2"] = {
                tarball = "dsh-cc-tui-0.1.2.tgz",
                sha256  = "<sha256 of the published tarball>",
            },
        },
```

**Do not hand-write this.** Mirroring is redistribution, so it is only legal
when the license permits it (`MIT`, `BSD-3-Clause`, `Apache-2.0`, `GPL-3.0`);
a package with no LICENSE file grants no rights at all. The mirror pipeline
verifies the license again at publish time — upstream can change it — builds
the tarball in CI, publishes it to both `github.com/xlings-res/dsh-plugins` and
`gitcode.com/xlings-res/dsh-plugins` under tag `<plugin>-<version>`, and only
then fills this block in.

If the tag is missing, CI fails closed rather than quietly downgrading to
direct — a `mirror` block that does not resolve would promise reproducibility
the index cannot deliver.

## 4. Verify

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .   # must pass first
git checkout -- pkgs/                        # the harness appends the template
pytest -q
```

Then install it for real, in an isolated home so your own environment is not
touched.

> **Append the template first.** `xlings config --add-xpkg` takes the file as
> it is on disk, and a descriptor on its own has no `type` and no `xpm` — those
> only exist after `pkgindex-build.lua` appends `template.lua`. Register a raw
> descriptor and the install fails with
> `package 'local:<name>' not found, searched repos: [xim]`, which reads like a
> broken recipe and is not one. Run the harness first, and restore `pkgs/`
> afterwards.

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .    # appends template.lua in place

TMP_X=$(mktemp -d); TMP_D=$(mktemp -d)
XLINGS_HOME=$TMP_X xlings update
XLINGS_HOME=$TMP_X xlings config --add-xpkg "$PWD/pkgs/d/dsh-cc-tui.lua"
XLINGS_HOME=$TMP_X DSH_HOME=$TMP_D XIM_DSH_PROFILE=verify \
  xlings install local:dsh-cc-tui -y

jq '.dependencies, .dsh.profile.bundles' "$TMP_D/profiles/verify/package.json"
DSH_HOME=$TMP_D dsh --profile verify --dump-config | grep "^# == "

XLINGS_HOME=$TMP_X DSH_HOME=$TMP_D XIM_DSH_PROFILE=verify \
  xlings remove local:dsh-cc-tui -y
jq '.dependencies, .dsh.profile.bundles' "$TMP_D/profiles/verify/package.json"

rm -rf "$TMP_X" "$TMP_D"
git checkout -- pkgs/                          # undo the harness append
```

A passing run looks like this (dsh-cc-tui, measured):

```
deps:    {"dsh-cc-tui": "github:ccch1mneyyy/dsh-cc-tui#4aa91903..."}
bundles: ["@deepseek-ai/dsh-base", "dsh-cc-tui"]
--dump-config: # == dsh-cc-tui        <- the layer is composed
after remove:  deps None, bundles ["@deepseek-ai/dsh-base"], layer gone
```

Acceptance is the **`--dump-config` layer**, not the installer's exit code. A
hook that fails can still be reported as `✓ installed`, and `xlings` skips the
install hook entirely when the same name and version exists under another
namespace — clear both before testing:

```bash
rm -rf ~/.xlings/data/xpkgs/{dsh,local}-x-<name>/<version>
```

For a `needs_build = true` package, check that installing **warns** and does
not build. Nothing this recipe runs executes upstream code — `pnpm store add`
only fetches — so the gate is pnpm's own `allowBuilds`, and it applies when
the user composes the plugin into a profile. An index-owned opt-in here would
have been a second, weaker copy of the gate that actually stops the script.

## 5. PR

One PR, one kind of change. Include:

1. what the plugin does and its upstream repo
2. the pinned sha and the upstream version it corresponds to
3. its license, and therefore whether it is mirror-eligible
4. `needs_build`, and if true, why it is worth indexing
5. the `--dump-config` output showing the layer
6. the profile manifest after uninstall, showing it is clean

Commit format: `<type>(<scope>): <description>`, e.g.
`feat(pkg): add dsh-cc-tui 0.1.2`.
