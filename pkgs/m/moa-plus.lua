package = {
    spec = "1",

    name = "moa-plus",
    description = "Multi-agent collaboration for DeepSeek Harness: persistent agents, shared knowledge, direct communication, and independent review.",
    repo = "https://github.com/Burns1028/moa-plus",
    homepage = "https://github.com/Burns1028/moa-plus",
    licenses = {"MIT"},
    authors = {"Burns1028"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-project-mode",

        versions = {
            ["0.2.0"] = { commit = "5ab9e1d89d2265eb8420082dcb72d823bde01488" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
