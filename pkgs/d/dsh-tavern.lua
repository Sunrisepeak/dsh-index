package = {
    spec = "1",

    name = "dsh-tavern",
    description = "DSH 原生酒馆管理面板，入口：设置 → 通用设置 → 酒馆管理（原生）。多角色卡/多世界书/多预设，会话级预设隔离；世界书智能关键词注入省 60-70% 上下文；记忆总结 + 角色关系网；剧情选项一键发送；创作/扮演双模式；NSFW 成人模式。免费非商用（CC BY-NC-SA 4.0）。安装：dsh plugin --profile web add dsh-tavern",
    repo = "https://github.com/chen731215-dev/dsh-tavern",
    homepage = "https://github.com/chen731215-dev/dsh-tavern",
    authors = {"chen731215-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tavern",

        versions = {
            ["1.7.1"] = { commit = "cfc51fe8300bc90f5aab36a3adeb71eca6b33676" },
        },
        latest = "1.7.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
