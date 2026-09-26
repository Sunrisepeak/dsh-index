package = {
    spec = "1",

    name = "dsh-gov-portal",
    description = "dsh-gov-portal",
    repo = "https://github.com/ExElectron/dsh-gov-portal",
    homepage = "https://github.com/ExElectron/dsh-gov-portal",
    licenses = {"MIT"},
    authors = {"ExElectron"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-gov-portal",

        versions = {
            ["0.1.0"] = { commit = "978ca7e41c5cae1ec1599d81aed687ce7488d5ad" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
