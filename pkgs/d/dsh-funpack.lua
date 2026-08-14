package = {
    spec = "1",

    name = "dsh-funpack",
    description = "DeepSeek Harness的一些有趣插件",
    repo = "https://github.com/lvyuchuiyi/dsh-funpack",
    homepage = "https://github.com/lvyuchuiyi/dsh-funpack",
    licenses = {"MIT"},
    authors = {"lvyuchuiyi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-funpack",

        versions = {
            ["0.10.0"] = { commit = "dcf54646d0ae10594e0beed22fc22d416ba1174d" },
        },
        latest = "0.10.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
