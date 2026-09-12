package = {
    spec = "1",

    name = "dsh-plugin-background",
    description = "dsh壁纸插件",
    repo = "https://github.com/gameswu/dsh-plugin-background",
    homepage = "https://github.com/gameswu/dsh-plugin-background",
    licenses = {"MIT"},
    authors = {"gameswu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-background",

        versions = {
            ["0.2.0"] = { commit = "f8a45fedf33c6481e931629d81073699190530f6" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
