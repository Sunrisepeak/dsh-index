package = {
    spec = "1",

    name = "dsh-skillhub",
    description = "DSH manager for user Skills already on disk in Agent home and DSH home",
    repo = "https://github.com/aa2246740/dsh-skillhub",
    homepage = "https://github.com/aa2246740/dsh-skillhub",
    licenses = {"MIT"},
    authors = {"aa2246740"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@aa2246740/dsh-skillhub",

        versions = {
            ["1.0.5"] = { commit = "1b24f4d72240aac70dd7363b2f05858e097637fe" },
        },
        latest = "1.0.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
