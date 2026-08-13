package = {
    spec = "1",

    name = "dsh-minigames",
    description = "DSH Web UI 右侧小游戏面板：18 款离线小游戏（恐龙跳一跳 / 俄罗斯方块 / 坦克大战 / 扫雷 / 2048 / 数独 / 吃豆人 / 跟枪练习等），可扩展游戏注册表，等待模型回复或修 bug 时的摸鱼神器",
    repo = "https://github.com/lhh010/dsh-minigames",
    homepage = "https://github.com/lhh010/dsh-minigames",
    licenses = {"BSD-3-Clause"},
    authors = {"lhh010"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "provider"},
    keywords = {"dsh", "minigames"},

    dsh = {
        bundle_name = "@dsh-external/dsh-minigames",

        versions = {
            ["0.3.2"] = { commit = "a22b3c143839e4ed75e98e64345e41fb02f8d9c0" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
