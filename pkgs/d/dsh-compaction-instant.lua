package = {
    spec = "1",

    name = "dsh-compaction-instant",
    description = "LLM-free lossless* compaction engine for DeepSeek Harness",
    repo = "https://github.com/TsFreddie/dsh-compaction-instant",
    homepage = "https://github.com/TsFreddie/dsh-compaction-instant",
    licenses = {"MIT"},
    authors = {"TsFreddie"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-compaction-instant",

        versions = {
            ["0.1.4"] = { commit = "f6f300fdf2e6841d0f69bf81b8f4c0f69f5241f6" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
