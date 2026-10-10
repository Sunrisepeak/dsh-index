package = {
    spec = "1",

    name = "scientificfigurelibrary",
    description = "Local-first MCP App for scientific figures. Import, review, and publish a global library on disk; reuse exact templates in Pi, DeepSeek Harness (dsh), Claude, Codex, Cursor, and Wisp.",
    repo = "https://github.com/xuzhougeng/ScientificFigureLibrary",
    homepage = "https://github.com/xuzhougeng/ScientificFigureLibrary",
    licenses = {"MIT"},
    authors = {"xuzhougeng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "scientific-figure-library",

        versions = {
            ["0.8.1"] = { commit = "765a75ba1bd263f47b47368434826aa85370d35c" },
        },
        latest = "0.8.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
