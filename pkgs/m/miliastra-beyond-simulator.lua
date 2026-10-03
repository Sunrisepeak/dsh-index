package = {
    spec = "1",

    name = "miliastra-beyond-simulator",
    description = "千星沙箱模拟器：Lua 驱动的 2D 奇域外置沙箱 ，支持 DeepSeek Harness、Web 和 MCP",
    repo = "https://github.com/1475505/miliastra-beyond-simulator",
    homepage = "https://github.com/1475505/miliastra-beyond-simulator",
    licenses = {"GPL-3.0"},
    authors = {"1475505"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-beyond-simulator",

        versions = {
            ["2.0.4"] = { commit = "020cf3238945168998f6d512cc1830e68e018e27" },
        },
        latest = "2.0.4",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
