
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
        -- Pinned: a floating member would make this package name a
        -- different set of bytes on different days.
        deps[#deps + 1] = "dsh:" .. m.name .. "@" .. m.version
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

-- A plugin's truth is its own payload, because installing a plugin no longer
-- touches a profile. Registering it is the composing step, and that belongs to
-- whoever composes -- an Agent, a group, or the user typing the command this
-- recipe prints. A plugin that registered itself put its bundle into a profile
-- that an Agent had not chosen, so installing an Agent left its five members
-- in `web` as well as in the Agent's own profile.
--
-- A group owns no profile entry either, so its truth is its members: it is
-- installed exactly when every member is. Asking each member is what makes
-- `xlings install` idempotent for a group without inventing a marker that
-- could disagree with reality.
function installed()
    if KIND == "group" then
        for _, m in ipairs(MEMBERS) do
            if not member_spec(m.name) then return false end
        end
        return #MEMBERS > 0
    end

    if KIND == "plugin" then
        if MIRROR then
            local m = MIRROR[pkginfo.version()]
            return m ~= nil
               and os.isfile(path.join(pkginfo.install_dir(), m.tarball))
        end
        -- Architecture A keeps no tarball of its own; what `install()` produced
        -- is a warmed pnpm store plus this note of the spec it warmed.
        return os.isfile(path.join(pkginfo.install_dir(), "spec.txt"))
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

    return false
end

function install()
    if KIND ~= "plugin" then
        -- A group and an Agent have no payload at all: they are manifests, and
        -- their members carry the bytes.
        return true
    end

    -- Per VERSION, not per package. Mirroring is a licence answer given one
    -- tarball at a time, and tools/mirror.py publishes a version only after
    -- it verifies that tarball -- so a package routinely carries a `mirror`
    -- block for 0.1.0 while its newly bumped 0.6.0 has no entry yet. Asking
    -- `if not MIRROR` took the mirrored branch for that package and then
    -- indexed a nil, which is every package for as long as the window between
    -- a bump landing and the mirror pipeline running. `spec()` above already
    -- gets this right; install() did not.
    local m = MIRROR and MIRROR[pkginfo.version()]

    if not m then
        -- Architecture A has no tarball this index may redistribute, but the
        -- bytes can still be fetched now rather than at compose time: pnpm's
        -- store is content-addressed and shared, so warming it at the pinned
        -- commit makes the later `dsh plugin add` resolve locally.
        --
        -- `store add` fetches; it does not run a `prepare` script -- the
        -- tarball comes straight from codeload. So nothing here executes
        -- upstream code, and the index no longer needs a gate of its own:
        -- pnpm's allowBuilds already guards the place where execution
        -- actually happens, which is the compose command this recipe prints.
        -- An opt-in we owned would have been a second, weaker copy of it.
        os.tryrm(pkginfo.install_dir())
        os.mkdir(pkginfo.install_dir())
        local spec = "github:" .. origin() .. "#"
                     .. package.dsh.versions[pkginfo.version()].commit
        print("")
        system.exec(("pnpm store add %s"):format(spec))
        local f = io.open(path.join(pkginfo.install_dir(), "spec.txt"), "w")
        if not f then return false end
        f:write(spec .. "\n")
        f:close()
        return true
    end

    local tgz = m.tarball
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
    -- A plugin does NOT register itself into a profile. Composing is a
    -- separate act with a separate owner: an Agent composes its members, a
    -- group's members are composed by whatever Agent uses them, and a user
    -- composing by hand owns the choice of profile. When the atom registered
    -- itself, installing one Agent put its five members into `web` as well,
    -- because each member had already decided where it belonged before the
    -- Agent ever ran.
    --
    -- What this leaves is what only this index can do: the bytes are here,
    -- pinned and (where the licence allows) checksummed and CN-mirrored. The
    -- composing command is one line, and it is printed exactly, so the step
    -- that remains is a paste rather than a lookup.
    local p = profile()
    local cmd = ("dsh plugin --profile %s add %s")
                :format(p, spec(pkginfo.version()))

    -- Only an un-mirrored package with a `prepare` script executes upstream
    -- code, and that now happens in the command above rather than here --
    -- pnpm's `store add` only fetches. Saying so before the user runs it is
    -- the point at which the warning is still useful.
    -- Per version here too, and for the same reason: the version being
    -- composed is the one whose bytes run, so a package with a mirrored
    -- 0.1.0 and an un-mirrored 0.6.0 must still warn on 0.6.0.
    if not (MIRROR and MIRROR[pkginfo.version()]) and package.dsh.needs_build then
        log.warn(("%s ships a `prepare` build script and is not mirrored "
               .. "(licence: %s), so composing it runs upstream code on your "
               .. "machine, outside any agent sandbox. pnpm blocks that until "
               .. "you allow it in %s.")
               :format(package.name,
                       (package.licenses and package.licenses[1]) or "unknown",
                       path.join(profile_dir(), "pnpm-workspace.yaml")))
    end

    warn_row_conflicts(package.dsh.overrides, package.dsh.bundle_name)

    local launch = (p == "web") and "dsh web" or ("dsh --profile " .. p)
    log.info(("%s is downloaded and pinned. It is not in any profile yet.\n"
           .. "  Add it:     %s\n"
           .. "  Launch it:  %s\n"
           .. "  '%s' is the profile this plugin's own README documents; any "
           .. "name works.")
           :format(package.name, cmd, launch, p))
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

    -- The surface. `dsh plugin --profile <new> add` scaffolds a profile with
    -- `@deepseek-ai/dsh-base` and nothing else, while dsh's own `web` profile
    -- carries `@deepseek-ai/dsh-web-app` beside it -- a bundle that ships
    -- inside the dsh installation and has no pnpm dependency, which is why
    -- the web profile's `dependencies` is empty.
    --
    -- Without it an Agent boots into a profile with no UI, and every plugin
    -- that attaches to one waits forever: `dsh-task-status: pending (waiting
    -- for service: webServer)`, then `1 entry did not activate`. The members
    -- all install, the manifest lists them all, and `--dump-config` prints a
    -- correct tree -- because none of those import anything.
    --
    -- It goes after dsh-base and before the members, so the members have a
    -- surface to attach to by the time they load.
    if package.dsh.surface and package.dsh.surface ~= "" then
        local mf = profile_manifest()
        local f = io.open(mf, "r")
        if not f then
            log.error(("%s: profile '%s' has no manifest to declare a surface in.")
                      :format(package.name, profile()))
            return false
        end
        local body = f:read("*a")
        f:close()
        if not body:find(package.dsh.surface, 1, true) then
            -- Insert after dsh-base, reusing that line's own indent and
            -- respecting whether it already ends in a comma. Writing the
            -- comma unconditionally produced `"…dsh-base",,` and left the
            -- manifest unparseable, which dsh reports as a JSON error rather
            -- than as a bad surface.
            local base = '"@deepseek-ai/dsh-base"'
            local i, j = body:find(base, 1, true)
            if not i then
                log.error(("%s: profile '%s' does not list dsh-base; cannot "
                        .. "place the surface."):format(package.name, profile()))
                return false
            end
            local indent = body:sub(1, i - 1):match("\n([ \t]*)$") or "        "
            local after = body:sub(j + 1, j + 1)
            local cut, sep = j, ","
            if after == "," then
                cut, sep = j + 1, ""          -- keep the comma that is there
            end
            body = body:sub(1, cut) .. sep .. "\n" .. indent .. "\""
                    .. package.dsh.surface .. "\","
                    .. body:sub(cut + 1)
            local w = io.open(mf, "w")
            if not w then
                log.error(("%s: cannot write the profile manifest."):format(package.name))
                return false
            end
            w:write(body)
            w:close()
        end
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

    if KIND == "profile" then
        -- An Agent gets a real command, named after the package: install
        -- `agent-web-coding` and you run `agent-web-coding`. The shim is an
        -- alias onto `dsh --profile <name>`, the same shape mcpp-short-cmd
        -- uses (`xvm.add(short, { alias = "mcpp " .. sub })`) -- the first
        -- token is another xvm-managed name, not a path, so this needs no
        -- knowledge of where dsh's launcher lives.
        --
        -- The name is xvm's, which means it is versioned and per-subos for
        -- free: two versions of an Agent can be installed at once and
        -- `xlings use <agent> <version>` switches which one the name resolves
        -- to, in this subos only.
        xvm.add(package.name, { alias = "dsh --profile " .. profile() })
        log.info(("Run it as a command:  %s"):format(package.name))
        return true
    end

    -- `type = "group"`: a plugin and a group back no executable. Left as the
    -- default program kind each would generate a shim that always fails
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

    if KIND == "profile" then
        print("")
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

    -- A plugin put itself into no profile, so there is none to take it out
    -- of. Whoever composed it -- an Agent, or the user -- owns that removal,
    -- and guessing at it here would take the bundle out from under a profile
    -- this recipe never touched.
    return true
end
