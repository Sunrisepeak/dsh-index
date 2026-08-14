package = {
    spec = "1",

    name = "dsh-auto-memory",
    description = "DSH 自动记忆插件:三层记忆(用户级/项目笔记/每日日志)自动注入与检索、每日反思、可视化面板与设置页,支持继承其他 AI 工具的历史记忆。An auto-memory plugin for the DeepSeek Harness Web GUI: three-layer memory (user-level / project notes / daily logs) with automatic injection and retrieval, daily reflections, a visual panel and settings page, and inheritance of memories from other AI tools.",
    repo = "https://github.com/Aik358/dsh-auto-memory",
    homepage = "https://github.com/Aik358/dsh-auto-memory",
    licenses = {"BSD-3-Clause"},
    authors = {"Aik358"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@a9i5k4/dsh-auto-memory",

        versions = {
            ["0.1.11"] = { commit = "462bf865c479b3a7407c4dfc184e9dd518c159d4" },
        },
        latest = "0.1.11",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
