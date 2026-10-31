package = {
    spec = "1",

    name = "dsh-qqbot",
    description = "让 QQ 机器人接入 DeepSeek Harness（dsh）的官方插件",
    repo = "https://github.com/tencent-connect/dsh-qqbot",
    homepage = "https://github.com/tencent-connect/dsh-qqbot",
    licenses = {"MIT"},
    authors = {"tencent-connect"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "qqbot",

        bundle_name = "@tencent-connect/dsh-qqbot",

        versions = {
            ["0.5.5"] = { commit = "a4a01fa9f122e187733fbd990c3d6a41e4d7e538" },
            ["0.5.4"] = { commit = "ee980be2b45dc868bb7ea58babc45775e4c2a871" },
            ["0.5.3"] = { commit = "d998f72fb4ab5492eaab3c5e1cc9de1d7901e8a9" },
            ["0.5.2"] = { commit = "c5f2d8c50dd2bbaec3f53ec50d00881ac5c711aa" },
            ["0.5.0"] = { commit = "0c2541c38e063b1506bb1aa9b61f9cda51ecf5d9" },
            ["0.4.0"] = { commit = "fcb128f277366c77c1df8ec233b6fa91ae2853f7" },
            ["0.1.0"] = { commit = "378540b916e3aa0b06221d449509313daa46813f" },
        },
        latest = "0.5.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
