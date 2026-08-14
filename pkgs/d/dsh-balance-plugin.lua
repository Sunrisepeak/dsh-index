package = {
    spec = "1",

    name = "dsh-balance-plugin",
    description = "dsh-balance-plugin",
    repo = "https://github.com/stevenx65/dsh-balance-plugin",
    homepage = "https://github.com/stevenx65/dsh-balance-plugin",
    licenses = {"MIT"},
    authors = {"stevenx65"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-balance-plugin",

        versions = {
            ["0.1.0"] = { commit = "9067ed33ac83f986b54096bcd21c2c1db0583bb4" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
