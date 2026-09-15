package = {
    spec = "1",

    name = "dsh-mini-tui",
    description = "DSH-TUI: a lightweight and fast terminal plugin connected directly to the DSH runtime.",
    repo = "https://github.com/boxeryao/dsh-mini-tui",
    homepage = "https://github.com/boxeryao/dsh-mini-tui",
    licenses = {"MIT"},
    authors = {"boxeryao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "dsh-mini-tui",

        versions = {
            ["0.2.1"] = { commit = "6b37de9bb5a2231d053ee1fbd086f27a1a95d274" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
