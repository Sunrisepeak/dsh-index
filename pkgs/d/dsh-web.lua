package = {
    spec = "1",

    name = "dsh-web",
    description = "DeepSeek Harness (DSH) Web Plugin Aggregation Ecosystem · Everything is a plugin, distributed via the Creative Workshop",
    repo = "https://github.com/zhu1090093659/dsh-web",
    homepage = "https://github.com/zhu1090093659/dsh-web",
    licenses = {"Apache-2.0"},
    authors = {"zhu1090093659"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web",

        versions = {
            ["0.1.1"] = { commit = "955e42a013ff77a5f9394766f75b2646633e26f7" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
