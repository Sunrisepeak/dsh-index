package = {
    spec = "1",

    name = "dsh-usage-statistics-panel",
    description = "DSH web plugin: per-day token usage statistics with a GitHub-style activity heatmap, cache hit-rate curve and per-model breakdown",
    repo = "https://github.com/HaoyueQin/dsh-usage-statistics-panel",
    homepage = "https://github.com/HaoyueQin/dsh-usage-statistics-panel",
    licenses = {"MIT"},
    authors = {"HaoyueQin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage-statistics-panel",

        versions = {
            ["0.3.2"] = { commit = "657953bfe5567dd33299d1ca417058285071d433" },
        },
        latest = "0.3.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
