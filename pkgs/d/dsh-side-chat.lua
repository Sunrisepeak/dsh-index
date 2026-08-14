package = {
    spec = "1",

    name = "dsh-side-chat",
    description = "一个 DSH 网页插件：在对话中选中部分内容后，即可在 侧边聊天里提问 —— 侧边聊天是位于右侧面板、按发起它的主会话隔离的独立聊天。",
    repo = "https://github.com/heartmove/dsh-side-chat",
    homepage = "https://github.com/heartmove/dsh-side-chat",
    licenses = {"MIT"},
    authors = {"heartmove"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-side-chat",

        versions = {
            ["0.1.0"] = { commit = "2d1c6f55124323522cf2e3bd0057f7ba957e16f6" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
