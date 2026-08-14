package = {
    spec = "1",

    name = "dsh-ui-appearance",
    description = "Appearance customization plugin for DeepSeek Harness: theme color palette, background image, opacity/blur, glass effect",
    repo = "https://github.com/TQSY114514/dsh-ui-appearance",
    homepage = "https://github.com/TQSY114514/dsh-ui-appearance",
    licenses = {"MIT"},
    authors = {"TQSY114514"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-client-ui-appearance",

        versions = {
            ["0.1.0-rc.6"] = { commit = "1be947a58f9313f7816c1757219845a38f5a5c80" },
        },
        latest = "0.1.0-rc.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
