package = {
    spec = "1",

    name = "dsh-archive-manager",
    description = "dsh-archive-manager",
    repo = "https://github.com/zimixvx/dsh-archive-manager",
    homepage = "https://github.com/zimixvx/dsh-archive-manager",
    licenses = {"MIT"},
    authors = {"zimixvx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-archive-manager",

        versions = {
            ["0.1.0"] = { commit = "7a8d968a1c76fe2a373a3690fb7cbf6c36cf533d" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
