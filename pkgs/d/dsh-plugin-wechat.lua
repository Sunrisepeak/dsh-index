package = {
    spec = "1",

    name = "dsh-plugin-wechat",
    description = "dsh-plugin-wechat",
    repo = "https://github.com/gnulife/dsh-plugin-wechat",
    homepage = "https://github.com/gnulife/dsh-plugin-wechat",
    licenses = {"MIT"},
    authors = {"gnulife"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-wechat",

        versions = {
            ["0.3.3"] = { commit = "4862b36e7b6fcfaee3e031345b2104ad7d7bef78" },
        },
        latest = "0.3.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
