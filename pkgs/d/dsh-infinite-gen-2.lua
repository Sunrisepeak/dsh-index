package = {
    spec = "1",

    name = "dsh-infinite-gen-2",
    description = "DeepSeek 专用破甲插件「无限二代」dsh-infinite-gen-2 — armor-breaking plugin for DeepSeek稳定化破甲提示词，求 Star 收藏 ⭐",
    repo = "https://github.com/Minglink/dsh-infinite-gen-2",
    homepage = "https://github.com/Minglink/dsh-infinite-gen-2",
    licenses = {"MIT"},
    authors = {"Minglink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-infinite-gen-2",

        versions = {
            ["0.2.3"] = { commit = "c72d2d178021d51547d08d70d33393324e3d58fa" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
