package = {
    spec = "1",

    name = "dsh-learn-everything",
    description = "dsh-learn-everything",
    repo = "https://github.com/cendaifeng/dsh-learn-everything",
    homepage = "https://github.com/cendaifeng/dsh-learn-everything",
    authors = {"cendaifeng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-learn-everything",

        versions = {
            ["0.1.0"] = { commit = "67cd99210c17564aff3183cae043ba7d2df085bc" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
