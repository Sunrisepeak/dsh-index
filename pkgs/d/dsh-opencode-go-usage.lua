package = {
    spec = "1",

    name = "dsh-opencode-go-usage",
    description = "DeepSeek Harness 插件:OpenCode Go 用量与花费悬浮仪表盘(配额、逐请求成本、模型/来源分布)",
    repo = "https://github.com/Xenia0922/dsh-opencode-go-usage",
    homepage = "https://github.com/Xenia0922/dsh-opencode-go-usage",
    licenses = {"MIT"},
    authors = {"Xenia0922"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-opencode-go-usage",

        versions = {
            ["1.6.0"] = { commit = "1dfe303e3b90ca956df2d15472f5e7b8a1f5ac8b" },
        },
        latest = "1.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
