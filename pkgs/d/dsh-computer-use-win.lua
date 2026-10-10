package = {
    spec = "1",

    name = "dsh-computer-use-win",
    description = "Windows computer use for DeepSeek Harness (dsh): MCP stdio server + PowerShell UIA backend, 22 desktop tools",
    repo = "https://github.com/Yu-tao-Li/dsh-computer-use-win",
    homepage = "https://github.com/Yu-tao-Li/dsh-computer-use-win",
    licenses = {"MIT"},
    authors = {"Yu-tao-Li"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-computer-use-win",

        versions = {
            ["0.2.4"] = { commit = "8467e001dd59edee99cb47bc32c25db22c03eff6" },
        },
        latest = "0.2.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
