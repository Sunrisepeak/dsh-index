package = {
    spec = "1",

    name = "brooks-lint",
    description = "AI code reviews grounded in 12 classic engineering books — decay risk diagnostics with book citations, severity labels, and 6 analysis modes including full-sweep auto-fix",
    repo = "https://github.com/hyhmrright/brooks-lint",
    homepage = "https://github.com/hyhmrright/brooks-lint",
    licenses = {"MIT"},
    authors = {"hyhmrright"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "brooks-lint",

        versions = {
            ["1.8.0"] = { commit = "cddd4b97a6d9fbfceb8f515977271692c46d6a2c" },
        },
        latest = "1.8.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
