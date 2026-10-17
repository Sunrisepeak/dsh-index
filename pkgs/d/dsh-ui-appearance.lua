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

        bundle_name = "dsh-ui-appearance",

        versions = {
            ["0.1.4"] = { commit = "291759aaaef8c88d23cd80d877bc86bab90e34da" },
        },
        latest = "0.1.4",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
