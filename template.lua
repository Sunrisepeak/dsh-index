
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
-- Two architectures share this one file. The branch is a single condition --
-- whether `package.dsh.mirror` exists:
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

package.type = "config"      -- a plugin contributes a config layer, not a program
package.archs = {"x86_64"}   -- bounded by xim:pnpm, which ships x86_64 only

local MIRROR   = package.dsh.mirror
local RES_REPO = "dsh-plugins"   -- one xlings-res repo, tagged <plugin>-<version>

-- xvm is registered even though a plugin has no executable. `xvm use` is not
-- about executables -- glibc.lua registers `libc.so` as `type = "lib"`, musl.lua
-- registers a `type = "group"` root that names no artifact at all. What xvm
-- provides here is the VIEW layer: on this machine 54 names already hold
-- different active versions across subos simultaneously (claude has 4, codex 3,
-- mcpp 5). pnpm's content-addressed store is the BYTE layer -- it makes
-- switching cheap (measured: switching back to a previously installed version
-- is `downloaded 0, reused 2`) but its "active" is a property of one directory,
-- so it cannot express "this shell, that version".
package.xvm_enable = true

do
    local xpm = {}
    for _, plat in ipairs({"linux", "macosx", "windows"}) do
        local t = {
            deps = {"xim:dsh", "xim:pnpm"},
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
                t[ver] = {}   -- architecture A: nothing to download; pnpm fetches
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

-- The profile follows the current subos by default, so entering a different
-- subos gives a different plugin set -- the same axis `xvm use` switches on.
-- Explicit DSH_PROFILE always wins; "web" is the last resort because that is
-- the profile upstream's own `dsh web` boots.
local function profile()
    local p = os.getenv("DSH_PROFILE")
    if p and p ~= "" then return p end
    p = os.getenv("XLINGS_SUBOS")
    if p and p ~= "" then return p end
    return "web"
end

local function dsh_home()
    local h = os.getenv("DSH_HOME")
    if h and h ~= "" then return h end
    return path.join(os.getenv("HOME") or os.getenv("USERPROFILE") or ".", ".dsh")
end

local function profile_manifest()
    return path.join(dsh_home(), "profiles", profile(), "package.json")
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
    if package.dsh.source == "npm" then
        return package.dsh.origin .. "@" .. version
    end
    return "github:" .. package.dsh.origin .. "#" .. package.dsh.versions[version].ref
end

-- Truth lives in the profile manifest, not in xim's own installed marker: the
-- user can run `dsh plugin remove` behind our back at any time.
function installed()
    local f = io.open(profile_manifest(), "r")
    if not f then return false end
    local body = f:read("*a")
    f:close()
    return body:find(package.dsh.bundle_name, 1, true) ~= nil
end

function install()
    if not MIRROR then
        return true   -- architecture A: no payload; pnpm fetches in config()
    end

    local tgz = MIRROR[pkginfo.version()].tarball
    os.tryrm(pkginfo.install_dir())
    os.mkdir(pkginfo.install_dir())
    os.mv(pkginfo.install_file(), path.join(pkginfo.install_dir(), tgz))

    -- Assert the artifact, not the intent: a bare `return true` gets stamped as
    -- installed and leaves config() pointing pnpm at a file that is not there.
    return os.isfile(path.join(pkginfo.install_dir(), tgz))
end

function config()
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
               :format(package.name, package.dsh.license or "unknown"))
        return false
    end

    system.exec(("dsh plugin --profile %s add %s")
                :format(profile(), spec(pkginfo.version())))

    if not installed() then
        return false
    end

    -- `type = "group"`: this name backs no executable. Left as the default
    -- program kind it would generate a shim that always fails
    -- (subos/*/bin/<name> -> bin/xlings) and `self doctor` reports it as an
    -- orphan (openxlings/xlings#452).
    xvm.add(package.name, { type = "group" })
    return true
end

function uninstall()
    xvm.remove(package.name)
    system.exec(("dsh plugin --profile %s remove %s")
                :format(profile(), package.dsh.bundle_name))
    -- $DSH_HOME holds the user's own profiles and config layer. This recipe
    -- never created it and must not remove it.
    return true
end
