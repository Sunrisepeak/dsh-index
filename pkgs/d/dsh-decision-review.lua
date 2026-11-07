package = {
    spec = "1",

    name = "dsh-decision-review",
    description = "dsh-decision-review",
    repo = "https://github.com/ninetyhe-90/dsh-decision-review",
    homepage = "https://github.com/ninetyhe-90/dsh-decision-review",
    licenses = {"MIT"},
    authors = {"ninetyhe-90"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-decision-review",

        versions = {
            ["0.1.0"] = { commit = "81ba639b3fa8176e09d5eb5687d2c4489cdfe335" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
