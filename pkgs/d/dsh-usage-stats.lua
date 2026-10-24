package = {
    spec = "1",

    name = "dsh-usage-stats",
    description = "Token usage heatmap, per-model breakdowns, and DeepSeek account balance for the DeepSeek Harness Web GUI (dsh web).",
    repo = "https://github.com/Ychris12138/dsh-usage-stats",
    homepage = "https://github.com/Ychris12138/dsh-usage-stats",
    licenses = {"MIT"},
    authors = {"Ychris12138"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage-stats",

        versions = {
            ["0.1.2"] = { commit = "1f220b9d8e025087c9fdbd9efcf8d3d85659fead" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
