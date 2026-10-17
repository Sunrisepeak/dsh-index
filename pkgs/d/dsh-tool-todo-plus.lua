package = {
    spec = "1",

    name = "dsh-tool-todo-plus",
    description = "DeepSeek Harness 任务清单插件：官方 todo_write 的增强 fork —— 优先级标签、完整清单渲染、可拖动的会话内浮动任务面板（位置记忆 / 双击复位 / 当前动作显示）",
    repo = "https://github.com/shuxidemosheng/dsh-tool-todo-plus",
    homepage = "https://github.com/shuxidemosheng/dsh-tool-todo-plus",
    authors = {"shuxidemosheng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-tool-todo-plus",

        versions = {
            ["0.7.3"] = { commit = "c5216b02461e380cd765700bf5db62d7875dbd9d" },
        },
        latest = "0.7.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
