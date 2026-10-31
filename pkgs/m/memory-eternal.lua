package = {
    spec = "1",

    name = "memory-eternal",
    description = "🧠 给 AI 装第二大脑 · DSH 插件：对话结束自动沉淀知识卡，跨会话召回，知识图谱可视化，审核/回收/备份一体（SQLite，零外部依赖）",
    repo = "https://github.com/EternalNight996/memory-eternal",
    homepage = "https://github.com/EternalNight996/memory-eternal",
    licenses = {"MIT"},
    authors = {"EternalNight996"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "memory-eternal",

        versions = {
            ["0.15.0"] = { commit = "50493db36b042b1afa2af2b1784c5cd43f897cc1" },
        },
        latest = "0.15.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
