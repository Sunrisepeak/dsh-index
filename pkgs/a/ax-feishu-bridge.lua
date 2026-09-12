package = {
    spec = "1",

    name = "ax-feishu-bridge",
    description = "飞书/Lark 机器人桥接，同时支持 Pi 和 DeepSeek Harness（DSH）双平台，随时随地远程与你的编程助手对话",
    repo = "https://github.com/AX1202/ax-feishu-bridge",
    homepage = "https://github.com/AX1202/ax-feishu-bridge",
    authors = {"AX1202"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "ax-feishu-bridge",

        versions = {
            ["0.4.3"] = { commit = "9bc42c3a27c872c9bb873c429488c83eceb5b48e" },
        },
        latest = "0.4.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
