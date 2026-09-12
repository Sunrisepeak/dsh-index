package = {
    spec = "1",

    name = "engramory",
    description = "A portable memory protocol for AI agents — load it as standing rules; a curation discipline + reference spec + optional cap hook.",
    repo = "https://github.com/tinqiao-oss/engramory",
    homepage = "https://github.com/tinqiao-oss/engramory",
    licenses = {"MIT"},
    authors = {"tinqiao-oss"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-engramory",

        versions = {
            ["0.2.0"] = { commit = "4e04aa7a61c80a52f957bca8c8f9753a35f4e519" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
