package = {
    spec = "1",

    name = "dsh-recall-unread",
    description = "DeepSeek Harness (DSH) 插件：在模型读取前撤回已发送的文字消息，支持单条与全部撤回。A DeepSeek Harness plugin that recalls sent-but-unread text messages before the model reads them — one-by-one or all at once.",
    repo = "https://github.com/hg1048596-pixel/dsh-recall-unread",
    homepage = "https://github.com/hg1048596-pixel/dsh-recall-unread",
    licenses = {"MIT"},
    authors = {"hg1048596-pixel"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-recall-unread",

        versions = {
            ["1.1.0"] = { commit = "e9a22bad1f246584ac153a250436732c754b7e72" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
