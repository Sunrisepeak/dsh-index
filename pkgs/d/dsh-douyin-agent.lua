package = {
    spec = "1",

    name = "dsh-douyin-agent",
    description = "DSH 原生抖音助手：有限自主观看、共享人格与兴趣记忆、原生设置和观看日报。",
    repo = "https://github.com/LockyBee/dsh-douyin-agent",
    homepage = "https://github.com/LockyBee/dsh-douyin-agent",
    licenses = {"MIT"},
    authors = {"LockyBee"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-douyin-browser-local",

        versions = {
            ["1.4.6"] = { commit = "7989640e340f0fd79e2de9874880d5197546e755" },
        },
        latest = "1.4.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
