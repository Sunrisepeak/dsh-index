package = {
    spec = "1",

    name = "dsh-deepread",
    description = "Evidence-first deep reading for AI agents — trace claims, evidence, confidence and knowledge maps across articles, books and PDFs.",
    repo = "https://github.com/xiehuan123/dsh-deepread",
    homepage = "https://github.com/xiehuan123/dsh-deepread",
    licenses = {"MIT"},
    authors = {"xiehuan123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deepread",

        versions = {
            ["0.5.4"] = { commit = "cbfffab353112180456a6c26ed83de092d54ac12" },
        },
        latest = "0.5.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
