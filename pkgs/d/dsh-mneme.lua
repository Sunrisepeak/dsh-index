package = {
    spec = "1",

    name = "dsh-mneme",
    description = "Structured memory engine for DeepSeek Harness. Offline semantic search, entity-attribute-timeline, autoDream self-consolidation, and human-editable Markdown storage.",
    repo = "https://github.com/modusensus/dsh-mneme",
    homepage = "https://github.com/modusensus/dsh-mneme",
    licenses = {"MIT"},
    authors = {"modusensus"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@modusensus/dsh-mneme",

        versions = {
            ["0.3.7"] = { commit = "87b4c8f6426e98ba1df5db305a8912a21601668c" },
        },
        latest = "0.3.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
