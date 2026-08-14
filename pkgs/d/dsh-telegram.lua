package = {
    spec = "1",

    name = "dsh-telegram",
    description = "通过 Telegram 私聊远程使用和查看 DeepSeek Harness",
    repo = "https://github.com/yuko0331/DSH-telegram",
    homepage = "https://github.com/yuko0331/DSH-telegram",
    licenses = {"MIT"},
    authors = {"yuko0331"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-telegram-bot",

        versions = {
            ["0.1.0"] = { commit = "6d4aa71272214ddabae6899e9cb82053578c8798" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
