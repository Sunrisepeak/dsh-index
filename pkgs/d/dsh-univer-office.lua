package = {
    spec = "1",

    name = "dsh-univer-office",
    description = "Preview, create, edit office spreadsheets, docs & slides inside DeepSeek Harness. Power by Univer.",
    repo = "https://github.com/dream-num/dsh-univer-office",
    homepage = "https://github.com/dream-num/dsh-univer-office",
    licenses = {"Apache-2.0"},
    authors = {"dream-num"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-univer-office",

        versions = {
            ["0.2.6"] = { commit = "8b24547d8c6e8442b5e4445ef6d11f6d3df3ae9c" },
        },
        latest = "0.2.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
