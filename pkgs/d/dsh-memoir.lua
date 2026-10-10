package = {
    spec = "1",

    name = "dsh-memoir",
    description = "DSH 项目持久化记忆插件（TypeScript）：会话归纳 + 经验教训沉淀，写入 PROJECT_MEMORY.md 与全局索引；每轮工作结束自动提醒蒸馏、自动注入未来 AGENTS；附 Web GUI 记忆面板（项目/全局 tab、检索、手动记录/删除）。dsh-plugin",
    repo = "https://github.com/Qinling-Melon-Farmers/dsh-memoir",
    homepage = "https://github.com/Qinling-Melon-Farmers/dsh-memoir",
    licenses = {"Apache-2.0"},
    authors = {"Qinling-Melon-Farmers"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-memoir",

        versions = {
            ["0.4.3"] = { commit = "abf97709358f41de24324330af8d90c1bc4ef381" },
        },
        latest = "0.4.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
