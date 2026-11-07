package = {
    spec = "1",

    name = "dsh-deepseek-flow",
    description = "dsh-deepseek-flow",
    repo = "https://github.com/kanghelyu/dsh-deepseek-flow",
    homepage = "https://github.com/kanghelyu/dsh-deepseek-flow",
    licenses = {"MIT"},
    authors = {"kanghelyu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-flow",

        versions = {
            ["0.3.21"] = { commit = "06d3f16245757fd33f5c444bacfdff3747c5bc87" },
        },
        latest = "0.3.21",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
