package = {
    spec = "1",

    name = "dsh-compaction-instant",
    description = "LLM-free lossless* compaction engine for DeepSeek Harness",
    repo = "https://github.com/KitDoesIt/dsh-compaction-instant",
    homepage = "https://github.com/KitDoesIt/dsh-compaction-instant",
    licenses = {"MIT"},
    authors = {"KitDoesIt"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-compaction-instant",

        versions = {
            ["0.1.4"] = { commit = "03a53466b1d7eaef18e5b35f9f0d8be4f5ff41f0" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
