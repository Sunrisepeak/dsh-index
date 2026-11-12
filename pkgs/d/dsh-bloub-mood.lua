package = {
    spec = "1",

    name = "dsh-bloub-mood",
    description = "动态心情图标 · DeepSeek Harness 插件 — bloub 表情随会话状态切换 favicon 与 logo，形状/颜色/文字可配置（8 shapes × 12 colors, animated SVG, MIT）",
    repo = "https://github.com/Yuuhann1999/dsh-bloub-mood",
    homepage = "https://github.com/Yuuhann1999/dsh-bloub-mood",
    licenses = {"MIT"},
    authors = {"Yuuhann1999"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-bloub-mood",

        versions = {
            ["2.4.4"] = { commit = "c626528b3d6c32669c265d7144e85f60f48570d2" },
        },
        latest = "2.4.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
