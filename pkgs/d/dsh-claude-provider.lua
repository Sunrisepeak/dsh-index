package = {
    spec = "1",

    name = "dsh-claude-provider",
    description = "Custom Claude provider support for DeepSeek Harness",
    repo = "https://github.com/MoFeng2223/dsh-claude-provider",
    homepage = "https://github.com/MoFeng2223/dsh-claude-provider",
    licenses = {"MIT"},
    authors = {"MoFeng2223"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "@mofeng2223/dsh-claude-provider",

        versions = {
            ["0.2.3"] = { commit = "92634d1d2e2fa46e382f0248e0a99528ccec3183" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
