package = {
    spec = "1",

    name = "dsh-search-boost",
    description = "The plunge for dsh to boost model's search ability.",
    repo = "https://github.com/Mr-remon219/dsh-search-boost",
    homepage = "https://github.com/Mr-remon219/dsh-search-boost",
    licenses = {"MIT"},
    authors = {"Mr-remon219"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-search-boost",

        versions = {
            ["0.1.3"] = { commit = "be1c151741dee5844daf75c3b4b93dbc6bb85c57" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
