package = {
    spec = "1",

    name = "dsh-multica-runtime",
    description = "Support dsh runtime on Multica.",
    repo = "https://github.com/multica-ai/dsh-multica-runtime",
    homepage = "https://github.com/multica-ai/dsh-multica-runtime",
    authors = {"multica-ai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "multica",

        bundle_name = "@multica-ai/dsh-runtime",

        versions = {
            ["0.1.0-private.1"] = { commit = "e29aae228449dfe50e88af60ef4281e38ca44e2a" },
        },
        latest = "0.1.0-private.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
