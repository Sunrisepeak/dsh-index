package = {
    spec = "1",

    name = "dsh-speak-up",
    description = "DSH 插件：让她在没人跟她说话的时候主动搭话（本地掷骰子，掷中就走 DSH 自己的一轮）",
    repo = "https://github.com/Yuuyuko-uu/dsh-speak-up",
    homepage = "https://github.com/Yuuyuko-uu/dsh-speak-up",
    authors = {"Yuuyuko-uu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-speak-up",

        versions = {
            ["0.2.3"] = { commit = "c08df2bdf22d065326c48f82f4f572fb8de64251" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
