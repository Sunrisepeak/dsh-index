package = {
    spec = "1",

    name = "dsh-usage-billing",
    description = "dsh-usage-billing",
    repo = "https://github.com/940842546/dsh-usage-billing",
    homepage = "https://github.com/940842546/dsh-usage-billing",
    licenses = {"MIT"},
    authors = {"940842546"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage-billing",

        versions = {
            ["0.6.0"] = { commit = "e2939bd2a1a18e70b51d36df78b740d378964436" },
        },
        latest = "0.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
