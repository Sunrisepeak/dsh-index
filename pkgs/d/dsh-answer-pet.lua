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
            ["0.6.0"] = { commit = "eb51f16f80b2120841f725c65069d5b4e9ec4f37" },
        },
        latest = "0.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
