package = {
    spec = "1",

    name = "anime-find",
    description = "DeepSeek Harness 搜番插件：对话内多源搜索番剧，卡片展示 Bangumi 评分与详情，支持复制磁力。",
    repo = "https://github.com/cocofhu/anime-find",
    homepage = "https://github.com/cocofhu/anime-find",
    licenses = {"MIT"},
    authors = {"cocofhu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "anime-find",

        versions = {
            ["0.1.4"] = { commit = "e135c6c0d2b65074195010773c345e0da8a583cf" },
        },
        latest = "0.1.4",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
