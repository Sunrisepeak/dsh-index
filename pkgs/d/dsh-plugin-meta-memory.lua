package = {
    spec = "1",

    name = "dsh-plugin-meta-memory",
    description = "Structured long-term memory system for DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-meta-memory",
    homepage = "https://github.com/YYTbit/dsh-plugin-meta-memory",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-meta-memory",

        versions = {
            ["0.1.1"] = { commit = "b64b13816745f81d6f33a3b5e525d36d02931545" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
