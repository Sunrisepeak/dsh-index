package = {
    spec = "1",

    name = "dsh-lark-link",
    description = "High-reliability Feishu/Lark bridge for DeepSeek Harness — QR one-click auth, multi-mode agents, card-based commands, zero-loss outbox, media in/out, session-log doctor, reusable DSH Web GUI",
    repo = "https://github.com/amlyczz/dsh-lark-link",
    homepage = "https://github.com/amlyczz/dsh-lark-link",
    licenses = {"MIT"},
    authors = {"amlyczz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lark-link",

        versions = {
            ["0.3.0"] = { commit = "4265ddbb6f4292d2cd430f9207ae384663243b67" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
