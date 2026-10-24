package = {
    spec = "1",

    name = "dsh-kuikly-expert",
    description = "Kuikly DeepSeek Harness plugin that turns your AI agent into a Kuikly cross-platform app development expert.",
    repo = "https://github.com/Tencent-TDS/dsh-kuikly-expert",
    homepage = "https://github.com/Tencent-TDS/dsh-kuikly-expert",
    authors = {"Tencent-TDS"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-kuikly-expert",

        versions = {
            ["0.1.0"] = { commit = "e4969568984a20ce7af0be53ef6c3002e9fdfb27" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
