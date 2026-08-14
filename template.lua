
-- ─────────────────────────────────────────────────────────────────────────────
-- dsh-index common template, appended to every pkgs/**/*.lua by
-- pkgindex-build.lua at index-build time.
--
-- Descriptors carry DATA ONLY. Everything below -- type, xpm, and all four
-- lifecycle hooks -- is shared, because the upstream install paradigm is
-- uniform: 169 of 281 `topic:dsh-plugin` repos declare `dsh.bundle`, and 166
-- of those (98%) even use the same `./cordis.patch.yml` patch path. Writing
-- 169 copies of these hooks would be 169 copies that rot independently.
--
-- THREE KINDS share this file, declared as `dsh.kind`:
--
--   plugin   an atom: one upstream bundle. Fetches bytes (mirrored or direct)
--            and adds itself to the profile its own README documents.
--   group    a reusable set of plugins. No bytes of its own; `deps` pull the
--            members in, and the members land where they document.
--   profile  a complete Agent: harness + a member set + this Agent's own
--            opinion. Creates its profile, composes every member into it, and
--            writes its patch layer. `dsh --profile <name>` then boots it.
--
-- `kind` lives under `dsh.*` rather than in xpkg's `type` because `type` is a
-- closed enum: libxpkg's parse_type() returns PackageType::Package for any
-- unknown string, so `type = "dsh-agent"` would not fail -- it would vanish.
-- See .agents/docs/2026-08-14-agent-distribution-design.md section 2.3.
--
-- Within `plugin`, two delivery architectures share one branch -- whether
-- `package.dsh.mirror` exists:
--
--   mirror present  (C)  index-mirrored tarball: a real xpm resource with a
--                        sha256, works offline, survives upstream deletion,
--                        and needs no pnpm build authorisation because the
--                        build already happened in this index's CI. A CN URL
--                        is added only once the GitCode release is confirmed.
--   mirror absent   (A)  pnpm fetches straight from upstream. No CN mirror is
--                        possible -- xim's mirror table hangs off the xpm
--                        resource, and A's resource is `{}`.
--
-- Which one a package gets is decided by its LICENSE, not by a flag: mirroring
-- is redistribution. See .agents/docs/2026-08-13-dsh-plugin-index-design.md.
-- ─────────────────────────────────────────────────────────────────────────────

package.type = "config"      -- neither a plugin nor an Agent is a program
package.archs = {"x86_64"}   -- bounded by xim:pnpm, which ships x86_64 only

local KIND     = package.dsh.kind or "plugin"
local MIRROR   = package.dsh.mirror
local MEMBERS  = package.dsh.members or {}
local RES_REPO = "dsh-plugins"   -- one xlings-res repo, tagged <plugin>-<version>

-- `origin` is not a field: it is `package.repo` with the host stripped. Two
-- copies of the same fact are two things to keep in sync, and xpkg already has
-- `repo`. Same reason there is no `dsh.license` -- that is `package.licenses`.
local function origin()
    return (package.repo:gsub("^https?://[^/]+/", ""):gsub("%.git$", ""))
end

-- xvm is registered even though neither kind has an executable. `xvm use` is
-- not about executables -- glibc.lua registers `libc.so` as `type = "lib"`,
-- musl.lua registers a `type = "group"` root that names no artifact at all.
-- What xvm provides here is the VIEW layer: on this machine 54 names already
-- hold different active versions across subos simultaneously (claude has 4,
-- codex 3, mcpp 5). pnpm's content-addressed store is the BYTE layer -- it
-- makes switching cheap (measured: switching back to a previously installed
-- version is `downloaded 0, reused 2`) but its "active" is a property of one
-- directory, so it cannot express "this shell, that version".
package.xvm_enable = true

do
    local xpm = {}
    -- A group or an Agent needs its members present before it can compose
    -- them, and `deps` is how xpkg already says that: it resolves the closure,
    -- installs depth-first, and `dep_install_dir` hands back where each one
    -- landed. No new composition field -- see design section 2.2.
    local deps = {"xim:dsh", "xim:pnpm"}
    for _, m in ipairs(MEMBERS) do
        deps[#deps + 1] = "dsh:" .. m.name
    end

    for _, plat in ipairs({"linux", "macosx", "windows"}) do
        local t = {
            deps = deps,
            ["latest"] = { ref = package.dsh.latest },
        }
        for ver, _ in pairs(package.dsh.versions) do
            local m = MIRROR and MIRROR[ver]
            if m then
                local tag = package.name .. "-" .. ver
                local urls = {
                    GLOBAL = ("https://github.com/xlings-res/%s/releases/download/%s/%s")
                             :format(RES_REPO, tag, m.tarball),
                }
                -- CN is emitted only when the mirror pipeline confirmed the
                -- GitCode release exists. Declaring a CN URL that 404s is
                -- worse than having none: a user on the CN mirror gets a
                -- failed download instead of falling back, and the index
                -- would be promising an acceleration it does not have.
                if m.cn then
                    urls.CN = ("https://gitcode.com/xlings-res/%s/releases/download/%s/%s")
                              :format(RES_REPO, tag, m.tarball)
                end
                t[ver] = { url = urls, sha256 = m.sha256 }
            else
                -- Architecture A, and every group and Agent: nothing to
                -- download. pnpm fetches for A; a group and an Agent have no
                -- bytes of their own at all -- they are a few hundred bytes of
                -- manifest, and their members carry the payload (design 2.4).
                t[ver] = {}
            end
        end
        xpm[plat] = t
    end
    package.xpm = xpm
end

import("xim.libxpkg.pkginfo")
import("xim.libxpkg.system")
import("xim.libxpkg.xvm")
import("xim.libxpkg.log")

-- Which profile this package acts on -- upstream's rule, not one of ours.
--
-- In upstream's model the profile name is the USER's: `dsh plugin --profile
-- <name> add <pkg>` creates whatever name you pass, and their docs pick
-- `demo`, `cc-tui`, anything. Nothing about a plugin says what its profile
-- should be called.
--
-- So this index does not invent names. Where one comes from, by kind:
--
--   plugin   its own README, when that README tells readers a name to type
--            (tools/mine_profiles.py reads it, skipping placeholders like
--            `your-profile`); measured today, 65 say `web`, 2 say `tui`, 1
--            says `cc-tui`. Installing puts the plugin where its own
--            documentation says it will be.
--   Agent    `dsh.profile`, declared by the Agent package -- because the
--            Agent IS that profile, so the name is part of what it is
--            rather than something the index derived.
--
-- Everything else falls back to `web` -- the profile upstream's own `dsh web`
-- boots and its quick start creates. `XIM_DSH_PROFILE` overrides either.
--
-- The override is deliberately NOT called `DSH_PROFILE`: dsh reads no such
-- variable (its whole tree reads only DSH_HOME, DSH_WEB_URL and
-- DSH_TELEMETRY_DISABLED), so shipping that name would impersonate an
-- upstream variable that does not exist and would stop working the moment
-- upstream defined it to mean something else.
--
-- Two earlier rules were removed for the same reason: deriving a profile from
-- the current subos, and giving a "surface" plugin a profile named after
-- itself. Both were defensible defaults and both made every example in
-- upstream's documentation wrong under this index -- a user following
-- dsh-cc-tui's README typed `dsh --profile cc-tui` and got "profile does not
-- exist", because we had silently named it something else. Composing two
-- surfaces into one profile can conflict, but that is the user's composition
-- to manage, exactly as it is when they use `dsh plugin` directly.
local function profile()
    local p = os.getenv("XIM_DSH_PROFILE")
    if p and p ~= "" then return p end
    p = package.dsh.profile
    if p and p ~= "" then return p end
    return "web"
end

local function dsh_home()
    local h = os.getenv("DSH_HOME")
    if h and h ~= "" then return h end
    return path.join(os.getenv("HOME") or os.getenv("USERPROFILE") or ".", ".dsh")
end

local function profile_dir()
    return path.join(dsh_home(), "profiles", profile())
end

local function profile_manifest()
    return path.join(profile_dir(), "package.json")
end

local function manifest_body()
    local f = io.open(profile_manifest(), "r")
    if not f then return nil end
    local body = f:read("*a")
    f:close()
    return body
end

-- `dsh web` is upstream's own spelling for the web profile; anything else is
-- `--profile <name>`. Print what the user should actually type.
local function launch_cmd()
    local p = profile()
    return (p == "web") and "dsh web" or ("dsh --profile " .. p)
end

-- The argument handed to pnpm. Under C it is a local tarball inside our own
-- payload -- immune to upstream deletion, and it does not trip pnpm's
-- allowBuilds gate. Under A it is the upstream spec, always owner/repo pinned
-- to a 40-hex sha: package NAMES are not trustworthy in this ecosystem (36
-- community repos name themselves into the `@deepseek-ai/` scope that DeepSeek
-- actually owns on npm), so a bare name could silently resolve elsewhere.
local function spec(version)
    if MIRROR and MIRROR[version] then
        return path.join(pkginfo.install_dir(), MIRROR[version].tarball)
    end
    return "github:" .. origin() .. "#" .. package.dsh.versions[version].commit
end

-- A member's spec, from the directory xpkg already installed it into.
--
-- Members are required to be mirrored (tests/test_descriptors.py enforces it),
-- so this is always a real tarball on disk: a group or an Agent is the
-- reproducible unit of this index, and one whose members fetch from upstream
-- at boot would inherit every failure mode -- no CN mirror, no checksum, and
-- gone if the repo is deleted -- while presenting itself as a curated set.
-- The tarball name is derived, not globbed and not copied. `os.files` does not
-- exist in the libxpkg hook runtime -- an install that reached here died with
-- `attempt to call a nil value (field 'files')` after every member had already
-- been composed, so the failure looked like the Agent and was the glob.
--
-- Nothing needs to be looked up: xpkg installs a dependency into
-- `<store>/dsh-x-<name>/<version>`, and tools/mirror.py names every tarball
-- `<name>-<version>.tgz`. So the version is the last path component and the
-- filename follows from it, which also means this cannot drift out of sync
-- with the member's own descriptor the way a copied filename would.
local function member_spec(name)
    local dir = pkginfo.dep_install_dir("dsh:" .. name)
    if not dir then return nil end
    local ver = dir:match("[/\\]([^/\\]+)[/\\]?$")
    if not ver then return nil end
    local tgz = path.join(dir, name .. "-" .. ver .. ".tgz")
    if not os.isfile(tgz) then return nil end
    return tgz
end

-- Truth lives in the profile manifest, not in xim's own installed marker: the
-- user can run `dsh plugin remove` behind our back at any time.
--
-- A group owns no profile entry of its own, so its truth is its members: it is
-- installed exactly when every member is. Asking each member is what makes
-- `xlings install` idempotent for a group without inventing a marker file that
-- could disagree with reality.
function installed()
    if KIND == "group" then
        for _, m in ipairs(MEMBERS) do
            if not member_spec(m.name) then return false end
        end
        return #MEMBERS > 0
    end

    local body = manifest_body()
    if not body then return false end

    if KIND == "profile" then
        -- Match on the bundle name, which is what the manifest records. The
        -- descriptor name is often different (`dsh-annotation` is
        -- `@omdsh-dev/dsh-annotation` there), so checking that would report a
        -- correctly composed profile as incomplete.
        for _, m in ipairs(MEMBERS) do
            if not body:find(m.bundle, 1, true) then return false end
        end
        return #MEMBERS > 0
    end

    return body:find(package.dsh.bundle_name, 1, true) ~= nil
end

function install()
    if KIND ~= "plugin" or not MIRROR then
        -- Architecture A, groups and Agents: no payload. A plugin's bytes
        -- arrive via pnpm in config(); a group's and an Agent's arrive as
        -- their members' own installs.
        return true
    end

    local tgz = MIRROR[pkginfo.version()].tarball
    os.tryrm(pkginfo.install_dir())
    os.mkdir(pkginfo.install_dir())
    os.mv(pkginfo.install_file(), path.join(pkginfo.install_dir(), tgz))

    -- Assert the artifact, not the intent: a bare `return true` gets stamped as
    -- installed and leaves config() pointing pnpm at a file that is not there.
    return os.isfile(path.join(pkginfo.install_dir(), tgz))
end

-- Warn when this package replaces a base row another bundle already patches.
--
-- Two bundles patching the same row do not merge -- a patch replaces the row's
-- whole config, so the later layer wins and the earlier one silently stops
-- doing what its author intended. xpkg has no `conflicts` field and one would
-- not fit: what collides is a ROW, not a package. So the check reads the
-- composed tree, which already records who patched what, and says so rather
-- than letting the user discover it as odd behaviour.
--
-- A warning, not a refusal: upstream does not prevent this either, and the
-- composition is the user's to arrange. Inside a group or an Agent the same
-- fact is a hard CI gate instead (design section 3) -- there the index is the
-- one choosing the combination, so shipping a broken one is our bug, not a
-- situation to warn about.
local function warn_row_conflicts(rows, self_bundle)
    if not rows or #rows == 0 then return end

    -- pcall, not xmake's `try {}`: pkgindex-build.lua is evaluated in
    -- libxpkg's minimal plain-Lua sandbox where `try` is nil, and a nil call
    -- there kills the build with the error swallowed -- the index silently
    -- loses every xpm section. pcall is standard Lua and exists in both.
    local ok, dumped = pcall(os.iorun,
        ("dsh --profile %s --dump-config"):format(profile()))
    if not ok or type(dumped) ~= "string" then return end

    for _, row in ipairs(rows) do
        -- `# == <bundle>, patched by <other>` is how the dump marks an
        -- overridden row, so an existing patcher is readable by name.
        local other = dumped:match("patched by ([%w%-%._@/]+)[^\n]*\n%s*%- id: " .. row)
        if other and other ~= self_bundle then
            log.warn(("%s replaces row '%s', which %s already patches in "
                   .. "profile '%s'. The later one wins; put them in separate "
                   .. "profiles with XIM_DSH_PROFILE if both matter.")
                   :format(package.name, row, other, profile()))
        end
    end
end

local function config_plugin()
    -- Only an un-mirrored package with a `prepare` script executes upstream
    -- code on the user's machine at install time. pnpm >=10 refuses it until
    -- allowlisted, and that allowance is exactly what it sounds like. Mirrored
    -- packages were built in this index's CI, so they never reach this branch.
    if (not MIRROR) and package.dsh.needs_build
       and os.getenv("DSH_ALLOW_BUILDS") ~= "1" then
        log.error(("%s is not mirrored (license: %s), so it installs straight "
               .. "from git -- and it ships a `prepare` build script.\n"
               .. "Running it means executing this package's code on your "
               .. "machine at install time, outside any agent sandbox.\n"
               .. "If you trust it, reinstall with DSH_ALLOW_BUILDS=1.")
               :format(package.name,
                       (package.licenses and package.licenses[1]) or "unknown"))
        return false
    end

    -- pnpm writes straight to the terminal and its first line lands flush
    -- against whatever xlings printed last, so the two look like one message.
    -- One blank line is the whole fix.
    print("")
    system.exec(("dsh plugin --profile %s add %s")
                :format(profile(), spec(pkginfo.version())))

    if not installed() then
        return false
    end

    warn_row_conflicts(package.dsh.overrides, package.dsh.bundle_name)

    -- Say where it went and how to boot it. Without this the user has to
    -- guess the profile name, and the obvious guess -- the plugin's own name --
    -- is always wrong: `dsh --profile <plugin>` fails with "profile does not
    -- exist".
    log.info(("%s is installed in profile '%s'.\n  Launch it:  %s")
             :format(package.name, profile(), launch_cmd()))
    return true
end

local function config_group()
    -- A group installs nothing itself: `deps` already brought every member in,
    -- and each member landed in the profile its own README documents. What is
    -- left is to say what the user now has, because `xlings install` printing
    -- only the group's name would leave the actual contents invisible.
    local names = {}
    for _, m in ipairs(MEMBERS) do names[#names + 1] = "  - " .. m.name end
    log.info(("%s brought in %d plugins:\n%s")
             :format(package.name, #MEMBERS, table.concat(names, "\n")))
    return true
end

local function config_agent()
    -- An Agent is a manifest, so this is the whole of it: create the profile
    -- and compose every member into it. `dsh plugin --profile <name>`
    -- initialises the profile on first use, so there is nothing to create
    -- first -- upstream's own command is the constructor.
    print("")
    for _, m in ipairs(MEMBERS) do
        local s = member_spec(m.name)
        if not s then
            log.error(("%s: member '%s' has no installed tarball. Members must "
                    .. "be mirrored packages; this one resolved to nothing.")
                    :format(package.name, m.name))
            return false
        end
        system.exec(("dsh plugin --profile %s add %s"):format(profile(), s))
    end

    if not installed() then
        log.error(("%s: profile '%s' does not list every member after install.")
                  :format(package.name, profile()))
        return false
    end

    -- The Agent's own opinion. Of dsh's four patch layers only the profile's
    -- own cordis.patch.yml is both persistent and per-profile -- the bundle
    -- layer belongs to each plugin's author, $DSH_HOME/cordis.patch.yml is
    -- machine-wide, and `--patch` does not persist. So an Agent that wants to
    -- say "in this set, that row looks like this" has exactly one place to
    -- write it. See design section 2.5.
    if package.dsh.patch and package.dsh.patch ~= "" then
        local f = io.open(path.join(profile_dir(), "cordis.patch.yml"), "w")
        if not f then
            log.error(("%s: cannot write the patch layer into profile '%s'.")
                      :format(package.name, profile()))
            return false
        end
        f:write(package.dsh.patch)
        f:close()
    end

    log.info(("%s is ready as profile '%s' (%d plugins).\n  Launch it:  %s")
             :format(package.name, profile(), #MEMBERS, launch_cmd()))
    return true
end

function config()
    local ok
    if KIND == "group" then
        ok = config_group()
    elseif KIND == "profile" then
        ok = config_agent()
    else
        ok = config_plugin()
    end
    if not ok then return false end

    -- `type = "group"`: this name backs no executable. Left as the default
    -- program kind it would generate a shim that always fails
    -- (subos/*/bin/<name> -> bin/xlings) and `self doctor` reports it as an
    -- orphan (openxlings/xlings#452).
    xvm.add(package.name, { type = "group" })
    return true
end

function uninstall()
    xvm.remove(package.name)

    if KIND == "group" then
        -- Members are packages in their own right and may be shared with
        -- another group or Agent, or have been installed directly. xpkg's dep
        -- graph decides their fate; removing them here would take them out
        -- from under whoever else is using them.
        return true
    end

    print("")
    if KIND == "profile" then
        -- Remove by bundle name: that is what the profile manifest records
        -- and what pnpm matches on. Passing the descriptor name failed with
        -- ERR_PNPM_CANNOT_REMOVE_MISSING_DEPS partway through, leaving the
        -- profile half dismantled.
        for _, m in ipairs(MEMBERS) do
            system.exec(("dsh plugin --profile %s remove %s")
                        :format(profile(), m.bundle))
        end
        -- The profile directory itself stays. The user may have added their
        -- own plugins to it or edited its patch layer, and this recipe cannot
        -- tell those apart from what it put there.
        return true
    end

    system.exec(("dsh plugin --profile %s remove %s")
                :format(profile(), package.dsh.bundle_name))
    -- $DSH_HOME holds the user's own profiles and config layer. This recipe
    -- never created it and must not remove it.
    return true
end
