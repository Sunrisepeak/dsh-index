package = {
    spec = "1",

    name = "dsh-solo-thinking",
    description = "Solo-style isolated brainstorm branches and Handoffs for DeepSeek Harness",
    repo = "https://github.com/fredalxin/dsh-solo-thinking",
    homepage = "https://github.com/fredalxin/dsh-solo-thinking",
    licenses = {"MIT"},
    authors = {"fredalxin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-solo-thinking",

        versions = {
            ["0.1.18"] = { commit = "a4ad3f133efb37f1412cdf364764700bc7766d4f" },
        },
        latest = "0.1.18",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
