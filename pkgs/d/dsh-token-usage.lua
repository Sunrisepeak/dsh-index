package = {
    spec = "1",

    name = "dsh-token-usage",
    description = "dsh-token-usage",
    repo = "https://github.com/LaoYueHanNi/dsh-token-usage",
    homepage = "https://github.com/LaoYueHanNi/dsh-token-usage",
    authors = {"LaoYueHanNi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-token-usage",

        versions = {
            ["0.2.2"] = { commit = "ffbdfb79f90a4e44564d8079e5c0d8cedfade327" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
