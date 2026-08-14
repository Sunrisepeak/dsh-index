package = {
    spec = "1",

    name = "dsh-usage-chart",
    description = "A DeepSeek Harness Web plugin for real-time Token usage, cost estimates, per-round charts, and DeepSeek API balance.",
    repo = "https://github.com/Max-Samson/dsh-usage-chart",
    homepage = "https://github.com/Max-Samson/dsh-usage-chart",
    licenses = {"MIT"},
    authors = {"Max-Samson"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage-chart",

        versions = {
            ["0.2.0"] = { commit = "a1aedb87cb89ae027b5bc84c2ac35cfd1c99a9c0" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
