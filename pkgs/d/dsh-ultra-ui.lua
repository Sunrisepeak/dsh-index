package = {
    spec = "1",

    name = "dsh-ultra-ui",
    description = "dsh-ultra-ui",
    repo = "https://github.com/havingautism/dsh-ultra-ui",
    homepage = "https://github.com/havingautism/dsh-ultra-ui",
    authors = {"havingautism"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-ultra-ui",

        versions = {
            ["0.1.0"] = { commit = "d355496d2db120edbe287daff25ff4e008f9bea9" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
