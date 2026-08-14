package = {
    spec = "1",

    name = "dsh-report-html",
    description = "Generate self-contained interactive HTML reports from Markdown, tables, charts, China province maps, flowcharts, math, and drill-down tables — a DeepSeek Harness (dsh) plugin",
    repo = "https://github.com/hccccc01333/dsh-report-html",
    homepage = "https://github.com/hccccc01333/dsh-report-html",
    authors = {"hccccc01333"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-report-html",

        versions = {
            ["1.7.0"] = { commit = "2339f025382061ae8abcba8e13fd39b37604f535" },
        },
        latest = "1.7.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
