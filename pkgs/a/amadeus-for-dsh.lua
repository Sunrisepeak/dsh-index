package = {
    spec = "1",

    name = "amadeus-for-dsh",
    description = "Amadeus (AI assistant from Steins;Gate 0) for DeepSeek Harness",
    repo = "https://github.com/yyxcnasd/amadeus-for-dsh",
    homepage = "https://github.com/yyxcnasd/amadeus-for-dsh",
    licenses = {"MIT"},
    authors = {"yyxcnasd"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "amadeus-for-dsh",

        versions = {
            ["2.2.1"] = { commit = "671634deed695171e445c9586e58b971aeb38f19" },
        },
        latest = "2.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
