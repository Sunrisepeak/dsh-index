package = {
    spec = "1",

    name = "dsh-portable-tavern",
    description = "DeepSeek Harness 的「便携酒馆」插件：RPG 式 SillyTavern V2/V3 角色卡生成器 + 酒馆角色扮演聊天。支持世界书、角色卡 JSON/PNG 导入导出、面板主题与本地音乐。独立插件，仅依赖官方 @deepseek-ai SDK。",
    repo = "https://github.com/XCNXNXNX/dsh-portable-tavern",
    homepage = "https://github.com/XCNXNXNX/dsh-portable-tavern",
    licenses = {"BSD-3-Clause"},
    authors = {"XCNXNXNX"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-portable-tavern",

        versions = {
            ["0.2.2"] = { commit = "07c2d70a9425893052cc4a827ee3a187923171c1" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
