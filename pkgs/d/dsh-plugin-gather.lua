package = {
    spec = "1",

    name = "dsh-plugin-gather",
    description = "for better dsh",
    repo = "https://github.com/lilwhich/dsh-plugin-gather",
    homepage = "https://github.com/lilwhich/dsh-plugin-gather",
    licenses = {"MIT"},
    authors = {"lilwhich"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "my_better-dsh",

        versions = {
            ["0.9.6"] = { commit = "b2f40adac50b6873ec889e986f7c82a5a0d2a6eb" },
        },
        latest = "0.9.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
