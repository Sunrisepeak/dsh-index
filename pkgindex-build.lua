package = {
    spec = "1",

    name = "pkgindex-update",
    description = "dsh-index Package Index Build Tool",

    authors = {"sunrisepeak"},
    licenses = {"Apache-2.0"},
    repo = "https://github.com/Sunrisepeak/dsh-index",

    type = "auto-config",

    xpm = {
        windows = { ["latest"] = { } },
        linux = { ["latest"] = { } },
    },
}

local projectdir = os.scriptdir()
local pkgsdir = path.join(projectdir, "pkgs")
local template = path.join(projectdir, "template.lua")

-- This script executes under TWO different Lua runtimes:
--   1. xmake's sandbox (legacy xlings): cprint/cprintf/try/catch/raise/
--      os.getwinsize/path.relative are available, pcall/error are NOT.
--   2. libxpkg's plain-Lua build sandbox (xlings >= 0.4.52 artifact path,
--      run_pkgindex_build in xpkg-loader.cppm): full Lua stdlib (pcall/
--      error/io.write/io.flush) plus a cprint stub, but NONE of the
--      xmake-only helpers above. An error here is swallowed by the caller
--      and the built index silently loses its xpm sections — so every
--      non-shared primitive below is feature-detected, and CI runs
--      tests/libxpkg_sandbox_harness.lua to keep runtime 2 working.
local NS = "dsh"

-- console width (fallback 80) so the single self-refreshing line never wraps
local function term_width()
    local w = tonumber(os.getenv("COLUMNS") or "")
    if (not w) and type(os.getwinsize) == "function" then
        local sz = os.getwinsize()
        -- os.getwinsize reports a 32767 sentinel when there is no tty
        if type(sz) == "table" and sz.width and sz.width > 0 and sz.width < 1000 then
            w = sz.width
        end
    end
    if not w or w < 20 or w > 1000 then w = 80 end
    return w
end

-- one self-refreshing progress line (\r + clear-to-eol), file name
-- left-truncated so the whole line stays within the console width
local function progress(cnt, total, name, color)
    local prefix = string.format("[%d/%d] ", cnt, total)
    local label = NS .. "::"
    local budget = term_width() - #prefix - #label - 1
    if budget > 4 and #name > budget then
        name = ".." .. name:sub(#name - budget + 3)
    end
    if type(cprintf) == "function" then
        cprintf("\r[${%s}%d/%d${clear}] %s%s\027[K", color, cnt, total, label, name)
    elseif io and type(io.write) == "function" then
        io.write("\r" .. prefix .. label .. name .. "\027[K")
        if type(io.flush) == "function" then io.flush() end
    else
        print(prefix .. label .. name)
    end
end

local function fail_build(name, err)
    print("")  -- terminate the in-place progress line before reporting
    local msg = string.format("[pkgindex-build] failed at %s: %s", name, tostring(err))
    if type(cprint) == "function" then
        cprint("${red}" .. msg .. "${clear}")
    else
        print(msg)
    end
    if type(raise) == "function" then raise(msg) else error(msg) end
end

local function append_template(file, content)
    io.writefile(file, io.readfile(file) .. content)
end

function installed()
    return false
end

function install()
    -- Reset build outputs from a previous run. Only does real work under
    -- xmake; both calls are registered no-ops in the libxpkg sandbox, where
    -- the C++ caller performs the git reset itself.
    os.cd(pkgsdir)
    os.execv("git", {"clean", "-fdx"})
    os.execv("git", {"checkout", "."})

    local files = os.files(path.join(pkgsdir, "**.lua"))
    local template_content = io.readfile(template)
    local total = #files
    for i, file in ipairs(files) do
        local name = path.filename(file)
        if file:endswith("pkgindex-update.lua") then
            progress(i, total, name .. " (skip)", "yellow")
        else
            local ok, err = true, nil
            if type(pcall) == "function" then
                ok, err = pcall(append_template, file, template_content)
            else
                try {
                    function() append_template(file, template_content) end,
                    catch { function(e) ok = false; err = e end }
                }
            end
            if not ok then fail_build(name, err) end
            progress(i, total, name, "green")
        end
    end
    if total > 0 then print("") end  -- move off the progress line
    return true
end

function uninstall()
    return true
end
