package = {
    spec = "1",

    name = "dsh-goal-mode-enhance",
    description = "为 DeepSeek Harness 提供可视化 goal 模式：Goal 栏 / 头部入口 / 设置页（历史+多会话总览）/ goal_overview 模型工具",
    repo = "https://github.com/KarlOfLaw/dsh-goal-mode-enhance",
    homepage = "https://github.com/KarlOfLaw/dsh-goal-mode-enhance",
    licenses = {"MIT"},
    authors = {"KarlOfLaw"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-goal-mode",

        versions = {
            ["0.1.0"] = { commit = "bbb7a38c064f3e0c189b020156794c28114a8614" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
