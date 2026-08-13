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
        bundle_name = "dsh-cc-tui",     -- upstream package.json#name
        source = "github",              -- github | npm
        origin = "ccch1mneyyy/dsh-cc-tui",

        versions = {
            ["0.1.2"] = { ref = "4aa91903ed71a2a4ce9050978f4f3e92ec4314e1" },
        },
        latest = "0.1.2",

        needs_build = false,            -- true iff upstream has scripts.prepare
        license = "BSD-3-Clause",       -- decides mirror eligibility

        -- patch = "./dist/cordis.patch.yml",   -- only if not the default
    },
}
```

### Rules that the tests enforce

| Rule | Why |
|---|---|
| `ref` is 40 lowercase hex | A branch or tag can be moved under you. Upstream's own docs say pin a commit. |
| `bundle_name` is never the install spec | 36 community repos name themselves into `@deepseek-ai/`, a scope DeepSeek owns on npm. A bare name can resolve elsewhere later. |
| `latest` names a declared version | Otherwise `xlings install dsh:<name>` resolves to nothing. |
| `needs_build` is explicit | It gates arbitrary code execution on the user's machine. |
| `license` is recorded | It is the mirror gate — see below. |
| No hooks / `xpm` / `type` in a descriptor | `template.lua` supplies them; a local copy would be silently overridden. |

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
touched:

```bash
TMP_X=$(mktemp -d); TMP_D=$(mktemp -d)
XLINGS_HOME=$TMP_X xlings update
XLINGS_HOME=$TMP_X xlings config --add-xpkg "$PWD/pkgs/d/dsh-cc-tui.lua"
XLINGS_HOME=$TMP_X DSH_HOME=$TMP_D DSH_PROFILE=verify \
  xlings install local:dsh-cc-tui -y

jq '.dependencies, .dsh.profile.bundles' "$TMP_D/profiles/verify/package.json"
DSH_HOME=$TMP_D dsh --profile verify --dump-config | grep "^# == "

XLINGS_HOME=$TMP_X DSH_HOME=$TMP_D DSH_PROFILE=verify \
  xlings remove local:dsh-cc-tui -y
jq '.dependencies, .dsh.profile.bundles' "$TMP_D/profiles/verify/package.json"
rm -rf "$TMP_X" "$TMP_D"
```

Acceptance is the **`--dump-config` layer**, not the installer's exit code. A
hook that fails can still be reported as `✓ installed`, and `xlings` skips the
install hook entirely when the same name and version exists under another
namespace — clear both before testing:

```bash
rm -rf ~/.xlings/data/xpkgs/{dsh,local}-x-<name>/<version>
```

For a `needs_build = true` package, verify **both** paths: without
`DSH_ALLOW_BUILDS` it must fail, with `DSH_ALLOW_BUILDS=1` it must install.
"It installed without authorisation" is a security defect, not a convenience.

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
