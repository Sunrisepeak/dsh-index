package = {
    spec = "1",

    name = "dsh-fish-buddy",
    description = "鱼搭子：桌面小鲸鱼挂件 + DSH 插件（语音送话、陪看字幕、游戏弹幕、截图）",
    repo = "https://github.com/Yuuyuko-uu/dsh-fish-buddy",
    homepage = "https://github.com/Yuuyuko-uu/dsh-fish-buddy",
    authors = {"Yuuyuko-uu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-fish-buddy",

        versions = {
            ["0.8.2"] = { commit = "d800dcebd34febdff6f82233d219fb3d3efccb98" },
        },
        latest = "0.8.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
