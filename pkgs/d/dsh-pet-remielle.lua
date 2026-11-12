package = {
    spec = "1",

    name = "dsh-pet-remielle",
    description = "dsh-pet-remielle",
    repo = "https://github.com/Gin-7/dsh-pet-remielle",
    homepage = "https://github.com/Gin-7/dsh-pet-remielle",
    authors = {"Gin-7"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-client-ui-pet-remielle",

        versions = {
            ["0.2.0"] = { commit = "a9df1c186050cb56f9006c6f40ca845fd7b656c0" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
