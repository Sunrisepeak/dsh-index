package = {
    spec = "1",

    name = "dsh-billing-statistics",
    description = "Local billing dashboard for DSH model calls: multi-platform provider/model breakdowns of calls, tokens and spend, peak/off-peak pricing, manual CSV price import with peak windows, official-bill reconciliation, and HTML/PDF/CSV export.",
    repo = "https://github.com/SuLiuCanYing/dsh-billing-statistics",
    homepage = "https://github.com/SuLiuCanYing/dsh-billing-statistics",
    licenses = {"MIT"},
    authors = {"SuLiuCanYing"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-billing-statistics",

        versions = {
            ["1.14.0"] = { commit = "769bf03453a9ee6260d653b9c2642ae43bc984e3" },
        },
        latest = "1.14.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
