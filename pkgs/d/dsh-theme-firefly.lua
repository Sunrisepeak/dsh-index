package = {
    spec = "1",

    name = "dsh-theme-firefly",
    description = "dsh-theme-firefly",
    repo = "https://github.com/Liu-ZA-81/dsh-theme-firefly",
    homepage = "https://github.com/Liu-ZA-81/dsh-theme-firefly",
    licenses = {"MIT"},
    authors = {"Liu-ZA-81"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-theme-firefly",

        versions = {
            ["0.1.1"] = { commit = "aeaa164e682b3c4296b58c0e02402ae1da3d0329" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
