package = {
    spec = "1",

    name = "dsh-usage",
    description = "🌊 Persistent dock & fully-customizable balance/usage panel for DeepSeek Harness — activity heatmap, dual-channel comparison, local-only & privacy-first",
    repo = "https://github.com/Aisland-SJL/dsh-usage",
    homepage = "https://github.com/Aisland-SJL/dsh-usage",
    licenses = {"MIT"},
    authors = {"Aisland-SJL"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage",

        versions = {
            ["0.2.0"] = { commit = "1bad66ca26a9ad81c14bfaa07cc3a6cd29e31ac2" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
