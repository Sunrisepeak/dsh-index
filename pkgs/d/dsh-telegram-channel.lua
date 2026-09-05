package = {
    spec = "1",

    name = "dsh-telegram-channel",
    description = "DeepSeek Harness Telegram mobile remote: bind live Web sessions (Codex-style). Install: dsh plugin add github:hi-wenw/dsh-telegram-channel",
    repo = "https://github.com/hi-wenw/dsh-telegram-channel",
    homepage = "https://github.com/hi-wenw/dsh-telegram-channel",
    licenses = {"MIT"},
    authors = {"hi-wenw"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-telegram-channel",

        versions = {
            ["0.3.5"] = { commit = "93f3bec975044ab2b44cc319f2b61d6bd3959c9b" },
        },
        latest = "0.3.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
