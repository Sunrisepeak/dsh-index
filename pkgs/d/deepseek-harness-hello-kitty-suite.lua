package = {
    spec = "1",

    name = "deepseek-harness-hello-kitty-suite",
    description = "💗 一套给 DeepSeek Harness 的粉色 Hello Kitty 主题皮肤 + 任务完成/提问提醒插件（Sweetheart Workspace Expressive skin & Hello Kitty Task-Done Notifier）",
    repo = "https://github.com/Angel2518975237/deepseek-harness-hello-kitty-suite",
    homepage = "https://github.com/Angel2518975237/deepseek-harness-hello-kitty-suite",
    licenses = {"MIT"},
    authors = {"Angel2518975237"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-hello-kitty-suite",

        versions = {
            ["1.0.1"] = { commit = "1b8cd7e74ae9bb5cc53b82d6ce55dc134d2cc818" },
        },
        latest = "1.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
