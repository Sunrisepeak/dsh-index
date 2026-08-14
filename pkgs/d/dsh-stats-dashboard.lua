package = {
    spec = "1",

    name = "dsh-stats-dashboard",
    description = "DSH plugin: provider/model usage stats dashboard with response speed, call log, token totals, cache rate, cost estimates, CSV export",
    repo = "https://github.com/1HelloMan1/dsh-stats-dashboard",
    homepage = "https://github.com/1HelloMan1/dsh-stats-dashboard",
    authors = {"1HelloMan1"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-stats-dashboard",

        versions = {
            ["1.0.0"] = { commit = "4dc208d79d7e26b8d7004a1fd05132b81576e16f" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
