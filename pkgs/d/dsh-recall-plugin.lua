package = {
    spec = "1",

    name = "dsh-recall-plugin",
    description = "DSH 消息撤回插件：回到发送该消息时的状态",
    repo = "https://github.com/limbo947/DSH-recall-plugin",
    homepage = "https://github.com/limbo947/DSH-recall-plugin",
    licenses = {"MIT"},
    authors = {"limbo947"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-recall-plugin",

        versions = {
            ["1.0.4"] = { commit = "21c3311863dfc42d2c66fde6eabcca56a2f34066" },
        },
        latest = "1.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
