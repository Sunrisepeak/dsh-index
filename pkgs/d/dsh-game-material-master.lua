package = {
    spec = "1",

    name = "dsh-game-material-master",
    description = "dsh游戏素材大师插件。接入seedream生图模型和minimax视频生成模型，可生成各种游戏素材。",
    repo = "https://github.com/universe-st/dsh-game-material-master",
    homepage = "https://github.com/universe-st/dsh-game-material-master",
    licenses = {"MIT"},
    authors = {"universe-st"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-game-material-master",

        versions = {
            ["0.2.0"] = { commit = "026462a0925115f12a8c75f372cfd85572e72ef1" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
