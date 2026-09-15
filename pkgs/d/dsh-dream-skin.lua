package = {
    spec = "1",

    name = "dsh-dream-skin",
    description = "DeepSeek Harness 换肤 / 壁纸 / 主题包插件 (dsh-plugin) — 8 套 Mirage 主题、每用户强调色、壁纸2.0、主题包导入导出/分享链接、收藏与随机，纯原生 token 系统实现。",
    repo = "https://github.com/RevolutionLA/dsh-dream-skin",
    homepage = "https://github.com/RevolutionLA/dsh-dream-skin",
    licenses = {"MIT"},
    authors = {"RevolutionLA"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-dream-skin",

        versions = {
            ["0.2.5"] = { commit = "4b23d230dbeaac1f915ccb3c1a80dd3c19e7e603" },
        },
        latest = "0.2.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
