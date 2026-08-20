package = {
    spec = "1",

    name = "dsh-find-plugin",
    description = "Find DSH plugins inside the agent — live GitHub dsh-plugin topic search, star-ranked / 会话内搜索发现 DSH 插件",
    repo = "https://github.com/awesome-dsh-plugin/dsh-find-plugin",
    homepage = "https://github.com/awesome-dsh-plugin/dsh-find-plugin",
    licenses = {"MIT"},
    authors = {"awesome-dsh-plugin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-find-plugin",

        versions = {
            ["0.3.7"] = { commit = "e7a27eb01606e6deccdaacccb8e0cfd992c0bcdc" },
            ["0.3.6"] = { commit = "e75dc2e865c3cfbfd336f7b4bb753fec25d373e1" },
        },
        latest = "0.3.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
