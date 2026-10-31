package = {
    spec = "1",

    name = "dsh-skin-market",
    description = "dsh-skin-market",
    repo = "https://github.com/kingOfSoySauce/dsh-skin-market",
    homepage = "https://github.com/kingOfSoySauce/dsh-skin-market",
    licenses = {"MIT"},
    authors = {"kingOfSoySauce"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skin-market",

        versions = {
            ["0.1.18"] = { commit = "21d792bd443629e3e1fa81a0fd89cc38d36c4308" },
        },
        latest = "0.1.18",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
