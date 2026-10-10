package = {
    spec = "1",

    name = "risk-rule-design",
    description = "Rule mining for data risk control, distilled from the ideas of the \"100-Day Risk Control Expert\" course",
    repo = "https://github.com/pypcfx-glitch/risk-rule-design",
    homepage = "https://github.com/pypcfx-glitch/risk-rule-design",
    licenses = {"MIT"},
    authors = {"pypcfx-glitch"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-risk-rule-design",

        versions = {
            ["1.0.2"] = { commit = "89dff5161873917548ae28c1b1cb5f36f2f817fd" },
        },
        latest = "1.0.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
