package = {
    spec = "1",

    name = "dsh-client-ui-obsidian-memory",
    description = "deepseek harness plugin obsidian memory",
    repo = "https://github.com/detongz/dsh-client-ui-obsidian-memory",
    homepage = "https://github.com/detongz/dsh-client-ui-obsidian-memory",
    licenses = {"MIT"},
    authors = {"detongz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-client-ui-obsidian-memory",

        versions = {
            ["0.3.2"] = { commit = "042c7f2596e25c92200dc40a415fe8a084c5dc35" },
        },
        latest = "0.3.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
