package = {
    spec = "1",

    name = "dsh-novel-writer",
    description = "大肥鱼的小说工坊 — DSH 网络小说创作插件：九阶段门禁式创作流程 + 世界书设定注入 + 本地书籍导入 + AI 一键润色 + 去AI味 + 黄金三章诊断 + 百万字一致性 + 市场调研与模板复制。",
    repo = "https://github.com/akira399/dsh-novel-writer",
    homepage = "https://github.com/akira399/dsh-novel-writer",
    licenses = {"MIT"},
    authors = {"akira399"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-novel-writer",

        versions = {
            ["0.1.7"] = { commit = "3b389313113a2665500fa8624c88bff9b5e933d8" },
        },
        latest = "0.1.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
