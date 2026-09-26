package = {
    spec = "1",

    name = "novel-writer",
    description = "小说创作模式：一个统筹队长统领全局，5 个专职子代理各司其职——架构世界、策划剧情、管理人物、执笔写文、质检复核——协同写作。",
    repo = "https://github.com/sailoumili/novel-writer",
    homepage = "https://github.com/sailoumili/novel-writer",
    licenses = {"MIT"},
    authors = {"sailoumili"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "novel-writer",

        versions = {
            ["1.0.0"] = { commit = "12c5e16ff0fb30e531a39e8f86e12136082b18da" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
