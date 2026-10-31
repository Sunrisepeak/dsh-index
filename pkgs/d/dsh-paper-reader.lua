package = {
    spec = "1",

    name = "dsh-paper-reader",
    description = "DeepSeek Harness (dsh) 插件:论文伴读工作台 —— PDF 转录 / 检索 / 流式问答 + 内置阅读器页面。",
    repo = "https://github.com/GGboya/dsh-paper-reader",
    homepage = "https://github.com/GGboya/dsh-paper-reader",
    licenses = {"MIT"},
    authors = {"GGboya"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@ggboy123/dsh-paper-reader",

        versions = {
            ["1.6.0"] = { commit = "b4c0f3beb648b6792a24c5542a876c496c330edd" },
        },
        latest = "1.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
