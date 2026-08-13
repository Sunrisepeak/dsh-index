-- libxpkg_sandbox_harness.lua — run pkgindex-build.lua the way xlings' C++
-- core does, catching xmake-only constructs before they reach production.
--
-- xlings >= 0.4.52 does NOT run this script under xmake. libxpkg's
-- run_pkgindex_build() (xpkg-loader.cppm, register_build_sandbox) executes it
-- in a MINIMAL plain-Lua state: full Lua stdlib + the exact stubs replicated
-- below. Anything xmake-only (cprintf, try/catch, raise, os.getwinsize,
-- path.relative, ...) is nil there, install() dies, the error is swallowed by
-- the caller, and the built index silently loses every xpm section — which
-- breaks `xlings install <ns>:<pkg>` for ALL users on the artifact path.
-- That happened for real on 2026-07-14; this harness is the regression gate.
--
-- Usage: lua5.4 tests/libxpkg_sandbox_harness.lua [repo_dir]

local repo_dir = arg and arg[1] or "."

-- ── sandbox replication (keep in sync with register_build_sandbox) ──────────

os.scriptdir = function() return repo_dir end

path = path or {}
path.join = function(...)
    local parts = {}
    for i = 1, select("#", ...) do
        local v = select(i, ...)
        if v ~= nil then parts[#parts + 1] = tostring(v) end
    end
    return table.concat(parts, "/")
end
path.filename = function(p) return type(p) == "string" and (p:match("[^/\\]+$") or p) or "" end
path.directory = function(p) return type(p) == "string" and (p:match("(.*)[/\\]") or ".") or "." end
path.basename = function(p)
    if type(p) ~= "string" then return "" end
    local name = p:match("[^/\\]+$") or p
    return name:match("(.+)%.[^.]+$") or name
end

-- os.files: recursive scan with extension filter (C++ uses std::filesystem;
-- the harness shells out to `find` — CI runs on Linux)
os.files = function(pattern)
    local dir = pattern:match("(.*)/") or "."
    local ext = pattern:match("(%.[^./]+)$") or ""
    local t = {}
    local p = assert(io.popen("find '" .. dir .. "' -type f -name '*" .. ext .. "' | sort"))
    for line in p:lines() do t[#t + 1] = line end
    p:close()
    return t
end
os.isdir = function(p)
    if type(p) ~= "string" then return false end
    local f = io.popen("test -d '" .. p .. "' && echo yes")
    local out = f:read("*a"); f:close()
    return out:match("yes") ~= nil
end

-- no-ops in the build sandbox (git reset is done by the C++ caller)
os.cd = function(dir) end
os.execv = function(cmd, args) end

io.readfile = function(filepath)
    local f = io.open(filepath, "r")
    if not f then return "" end
    local content = f:read("*a")
    f:close()
    return content
end
io.writefile = function(filepath, content)
    local f = io.open(filepath, "w")
    if not f then return end
    f:write(content)
    f:close()
end

cprint = function(...)
    local args = { ... }
    local fmt = args[1] or ""
    fmt = fmt:gsub("%${.-}", "")
    if #args > 1 then
        print(string.format(fmt, table.unpack(args, 2)))
    else
        print(fmt)
    end
end

function string:endswith(suffix)
    return suffix == "" or self:sub(-#suffix) == suffix
end

-- ── run the build script exactly like run_pkgindex_build() ──────────────────

local build_script = repo_dir .. "/pkgindex-build.lua"
local chunk, load_err = loadfile(build_script)
assert(chunk, "pkgindex-build.lua failed to parse: " .. tostring(load_err))
chunk()

assert(type(install) == "function", "pkgindex-build.lua defines no install()")
local ok, run_err = pcall(install)
if not ok then
    io.write("\n")
    error("install() FAILED under the libxpkg plain-Lua sandbox "
        .. "(xmake-only construct?): " .. tostring(run_err))
end

-- ── verify: every package file got the template appended ────────────────────

local template = io.readfile(repo_dir .. "/template.lua")
assert(#template > 0, "template.lua missing or empty")

local files = os.files(repo_dir .. "/pkgs/**.lua")
assert(#files > 0, "no package files found under pkgs/")

local appended = 0
for _, f in ipairs(files) do
    if not f:endswith("pkgindex-update.lua") then
        local content = io.readfile(f)
        assert(content:find(template, 1, true),
            "template NOT appended to " .. f .. " — sub-index would be unresolvable")
        appended = appended + 1
    end
end

print(string.format("OK: install() ran in the libxpkg sandbox; template appended to %d package file(s)", appended))
