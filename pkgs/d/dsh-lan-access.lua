package = {
    spec = "1",

    name = "dsh-lan-access",
    description = "dsh-lan-access",
    repo = "https://github.com/Leon0555/dsh-lan-access",
    homepage = "https://github.com/Leon0555/dsh-lan-access",
    licenses = {"MIT"},
    authors = {"Leon0555"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lan-access",

        versions = {
            ["0.1.0"] = { commit = "5eea4062ccc8ad9de68c6cffd26492b9b31f7dad" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
