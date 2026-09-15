package = {
    spec = "1",

    name = "hanai-investment-dsh",
    description = "Local-first A-share research workbench for DeepSeek Harness: market dashboards, watchlists, valuation, four investor agents, versioned reports, and continuous post-report chat.",
    repo = "https://github.com/hancao97/hanai-investment-dsh",
    homepage = "https://github.com/hancao97/hanai-investment-dsh",
    licenses = {"MIT"},
    authors = {"hancao97"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "hanai-investment",

        bundle_name = "hanai-investment-dsh",

        versions = {
            ["0.1.0"] = { commit = "6381fdedfd4432d8ad222ae1bd0a659ab959aaca" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
