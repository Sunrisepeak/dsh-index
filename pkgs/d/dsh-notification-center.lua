package = {
    spec = "1",

    name = "dsh-notification-center",
    description = "DSH 通知中心插件：对话/任务完成、报错、等待批准等事件触发浏览器通知 + 21 种匹配音效",
    repo = "https://github.com/610la/dsh-notification-center",
    homepage = "https://github.com/610la/dsh-notification-center",
    authors = {"610la"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@lyhalal/dsh-notification-center",

        versions = {
            ["0.1.30"] = { commit = "bb06c309ab999c735cd4f62dc7a28f8e5af22ea4" },
        },
        latest = "0.1.30",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
