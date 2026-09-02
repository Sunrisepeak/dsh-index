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
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-minigames",

        versions = {
            ["0.3.11"] = { commit = "7162f03c2e4e8dd921ccc713e456e9264ab0fc2b" },
            ["0.3.10"] = { commit = "e38ac0035a0206a756ccb1fc6cb369b1e46937ec" },
            ["0.3.9"] = { commit = "175d55cb5af2b9a7463c30cec3ba9a0b009c54bc" },
            ["0.3.8"] = { commit = "72a623519d6137c9e32778747ad0d20c4e639e02" },
            ["0.3.7"] = { commit = "e62b1060703d3695f653f31aef1f69adf6f382d9" },
            ["0.3.6"] = { commit = "1bb6d8664281ea8d03cdf82050a398a69222a3ff" },
            ["0.3.5"] = { commit = "4d79c012c60f1be508c388c8319dbff9d1389a65" },
            ["0.3.4"] = { commit = "0f5f6908db0c2b913329547fba3781e186bb8972" },
            ["0.3.3"] = { commit = "9284a46a737676b48c58901a66cee31fd9d37a18" },
            ["0.3.2"] = { commit = "a22b3c143839e4ed75e98e64345e41fb02f8d9c0" },
        },
        latest = "0.3.11",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.3.2"] = {
                tarball = "dsh-minigames-0.3.2.tgz",
                sha256  = "6bc6bc12d185bdb31bd34fc2e661f14253cd6fbc26ea292b879424dfbe62c6f8",
                cn      = true,
            },
        },
    },
}
