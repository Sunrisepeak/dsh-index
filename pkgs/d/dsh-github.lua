package = {
    spec = "1",

    name = "dsh-github",
    description = "dsh-github",
    repo = "https://github.com/PivotStackIntelligence/dsh-github",
    homepage = "https://github.com/PivotStackIntelligence/dsh-github",
    licenses = {"MIT"},
    authors = {"PivotStackIntelligence"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-github",

        versions = {
            ["0.1.0"] = { commit = "b798d507cd43f79daa12acde03106a26228e2cb3" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
