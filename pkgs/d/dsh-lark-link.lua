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
            ["0.2.1"] = { commit = "113f8aeed391e05ce01e01efd7774dd884e02ba5" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
