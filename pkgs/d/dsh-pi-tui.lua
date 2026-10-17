package = {
    spec = "1",

    name = "dsh-pi-tui",
    description = "A third-party TUI mode for DeepSeek Harness (dsh), built on a vendored fork of pi-tui",
    repo = "https://github.com/XMoon/dsh-pi-tui",
    homepage = "https://github.com/XMoon/dsh-pi-tui",
    licenses = {"MIT"},
    authors = {"XMoon"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "pi-tui",

        bundle_name = "@xmoon76/dsh-pi-tui",

        versions = {
            ["0.2.1"] = { commit = "0ec4fcf14559754d9204c336cbb01e4fc246c16b" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
