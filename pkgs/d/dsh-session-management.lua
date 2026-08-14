package = {
    spec = "1",

    name = "dsh-session-management",
    description = "dsh-session-management",
    repo = "https://github.com/cokiscarazo-rgb/dsh-session-management",
    homepage = "https://github.com/cokiscarazo-rgb/dsh-session-management",
    licenses = {"MIT"},
    authors = {"cokiscarazo-rgb"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-management",

        versions = {
            ["1.0.4"] = { commit = "a73d24e1fed33f43ab277fd9b8e2a991650adfc6" },
        },
        latest = "1.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
