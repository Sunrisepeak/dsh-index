package = {
    spec = "1",

    name = "dsh-answer-pet",
    description = "dsh-answer-pet",
    repo = "https://github.com/Nanki-nn/dsh-answer-pet",
    homepage = "https://github.com/Nanki-nn/dsh-answer-pet",
    licenses = {"MIT"},
    authors = {"Nanki-nn"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-answer-pet",

        versions = {
            ["0.6.0"] = { commit = "a0827d41c3f8f9177622c460a99f1aeeb8034b8d" },
        },
        latest = "0.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
