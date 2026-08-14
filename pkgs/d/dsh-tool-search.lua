package = {
    spec = "1",

    name = "dsh-tool-search",
    description = "Tool search & slimming for DeepSeek Harness: Hermes-style progressive disclosure — search, describe, and call long-tail tools on demand",
    repo = "https://github.com/Letter2025/dsh-tool-search",
    homepage = "https://github.com/Letter2025/dsh-tool-search",
    authors = {"Letter2025"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tool-search",

        versions = {
            ["0.1.3"] = { commit = "009ffb13f4c90654c590741594571569efb083c1" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
