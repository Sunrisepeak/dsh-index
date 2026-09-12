package = {
    spec = "1",

    name = "dsh-tether",
    description = "Reach the DeepSeek Harness on your dev machine from your phone — across networks, through no server at all (iroh P2P)",
    repo = "https://github.com/zexadev/dsh-tether",
    homepage = "https://github.com/zexadev/dsh-tether",
    licenses = {"MIT"},
    authors = {"zexadev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-tether",

        versions = {
            ["0.1.3"] = { commit = "f59a17cb749d69040f7ba23c9e0dd265ebe933e9" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
