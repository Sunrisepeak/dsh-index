package = {
    spec = "1",

    name = "dsh-plugin-subagent-director",
    description = "Subagent Director: per-subagent LLM provider/model selection with role templates for DeepSeek Harness (dsh plugin)",
    repo = "https://github.com/SeverusZh/dsh-plugin-subagent-director",
    homepage = "https://github.com/SeverusZh/dsh-plugin-subagent-director",
    licenses = {"MIT"},
    authors = {"SeverusZh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-subagent-director",

        versions = {
            ["0.2.1"] = { commit = "657d9b38b679413fab7876617e98162c8435c9cf" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
