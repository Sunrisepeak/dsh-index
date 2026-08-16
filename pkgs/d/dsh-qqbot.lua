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
            ["0.4.0"] = { commit = "fcb128f277366c77c1df8ec233b6fa91ae2853f7" },
            ["0.1.0"] = { commit = "378540b916e3aa0b06221d449509313daa46813f" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
