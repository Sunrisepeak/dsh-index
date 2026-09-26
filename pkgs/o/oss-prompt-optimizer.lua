package = {
    spec = "1",

    name = "oss-prompt-optimizer",
    description = "用于优化 DeepSeek harness提示词优化器，提升 AI 输出质量",
    repo = "https://github.com/seven282/oss-prompt-optimizer",
    homepage = "https://github.com/seven282/oss-prompt-optimizer",
    licenses = {"MIT"},
    authors = {"seven282"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "oss-prompt-optimizer",

        versions = {
            ["1.8.1"] = { commit = "3166fb56f2dd46b4d8990f003bd9f64478fdaa4c" },
        },
        latest = "1.8.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
