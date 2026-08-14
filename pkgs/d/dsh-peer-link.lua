package = {
    spec = "1",

    name = "dsh-peer-link",
    description = "dsh-peer-link",
    repo = "https://github.com/czm15053/dsh-peer-link",
    homepage = "https://github.com/czm15053/dsh-peer-link",
    licenses = {"MIT"},
    authors = {"czm15053"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-peer-link",

        versions = {
            ["0.1.0"] = { commit = "a6c5aa872fcacc1ab3fababec00bed9222f09e0a" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
