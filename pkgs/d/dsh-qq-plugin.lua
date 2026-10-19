package = {
    spec = "1",

    name = "dsh-qq-plugin",
    description = "dsh-qq-plugin",
    repo = "https://github.com/xcisxc29/dsh-qq-plugin",
    homepage = "https://github.com/xcisxc29/dsh-qq-plugin",
    licenses = {"MIT"},
    authors = {"xcisxc29"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-qq-plugin",

        versions = {
            ["1.0.3"] = { commit = "9da260bdfc59a51f5e32b138b7eb288d2c55c8e9" },
        },
        latest = "1.0.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
