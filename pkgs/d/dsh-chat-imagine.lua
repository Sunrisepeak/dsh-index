package = {
    spec = "1",

    name = "dsh-chat-imagine",
    description = "在 DSH 聊天窗口自动调用生图工具（API 渠道，或本机 CLI：已支持mmx / codex / agy）并展示图片，也支持利用对应 CLI 识别图片。",
    repo = "https://github.com/corrinehu/dsh-chat-imagine",
    homepage = "https://github.com/corrinehu/dsh-chat-imagine",
    licenses = {"MIT"},
    authors = {"corrinehu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-chat-imagine",

        versions = {
            ["0.4.0"] = { commit = "0c3e600c5a2e4a5b22617c9d8e82eaf46779be79" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
