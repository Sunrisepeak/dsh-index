package = {
    spec = "1",

    name = "dsh-kimino-theme",
    description = "Kimi no Na wa (Your Name) theme for DeepSeek Harness Web GUI",
    repo = "https://github.com/niiang/dsh-kimino-theme",
    homepage = "https://github.com/niiang/dsh-kimino-theme",
    licenses = {"MIT"},
    authors = {"niiang"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-kimino-theme",

        versions = {
            ["66.1.0"] = { commit = "0a17159ecc9cf61834bac3265f5c8dab333431e9" },
        },
        latest = "66.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
