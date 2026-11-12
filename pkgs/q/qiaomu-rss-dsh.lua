package = {
    spec = "1",

    name = "qiaomu-rss-dsh",
    description = "在 DeepSeek Harness 中阅读 RSS，与原生 AI 对话伴读文章 | RSS reading with native AI companion for DeepSeek Harness",
    repo = "https://github.com/joeseesun/qiaomu-rss-dsh",
    homepage = "https://github.com/joeseesun/qiaomu-rss-dsh",
    licenses = {"GPL-3.0"},
    authors = {"joeseesun"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "qiaomu-rss-dsh",

        versions = {
            ["0.6.0"] = { commit = "14f9c56b8364120a49cefd2de172a437d5c3e4de" },
        },
        latest = "0.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
