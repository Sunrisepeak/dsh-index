package = {
    spec = "1",

    name = "dsh-infinite-gen-3",
    description = "DeepSeek 专用破甲插件「无限三代」dsh-infinite-gen-3 — armor-breaking plugin for DeepSeek，破甲版：稳定化破甲，求 Star 收藏 ⭐",
    repo = "https://github.com/Minglink/dsh-infinite-gen-3",
    homepage = "https://github.com/Minglink/dsh-infinite-gen-3",
    licenses = {"MIT"},
    authors = {"Minglink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-infinite-gen-3",

        versions = {
            ["0.5.0"] = { commit = "fb783ecaa1b8cd573684f86a76d3f102bd6c1dd0" },
        },
        latest = "0.5.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
