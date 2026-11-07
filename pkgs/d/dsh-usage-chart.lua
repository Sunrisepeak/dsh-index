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
            ["1.0.1"] = { commit = "8efd6ec4bd2f1662fd95b51e8a4bb9653e1ef84f" },
        },
        latest = "1.0.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
