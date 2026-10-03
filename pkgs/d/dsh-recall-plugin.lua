package = {
    spec = "1",

    name = "dsh-recall-plugin",
    description = "DSH 消息撤回插件：回到发送该消息时的状态 DSH Message Recall Plugin: Return to the state when the message was sent",
    repo = "https://github.com/limbo947/dsh-recall-plugin",
    homepage = "https://github.com/limbo947/dsh-recall-plugin",
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
            ["1.3.0"] = { commit = "bc4a873e06b25a46134da8bdbfcbe34c3740daff" },
        },
        latest = "1.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
