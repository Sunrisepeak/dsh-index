package = {
    spec = "1",

    name = "dsh-authinone",
    description = "Self-contained DeepSeek Harness (DSH) plugin for Provider/Auth login, model switching, image fallback, token/cost analytics, and same-port Web restart. Useful? A star helps.",
    repo = "https://github.com/Stormycry-cryp/dsh-AuthInOne",
    homepage = "https://github.com/Stormycry-cryp/dsh-AuthInOne",
    licenses = {"MIT"},
    authors = {"Stormycry-cryp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-auth-in-one",

        versions = {
            ["0.2.0-alpha.4"] = { commit = "190ecc2d834ba06da008522684e689324a9c2706" },
        },
        latest = "0.2.0-alpha.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
