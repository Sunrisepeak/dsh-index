package = {
    spec = "1",

    name = "dsh-theme-terraria",
    description = "把 DeepSeek Harness 的 AI 编码控制台变成泰拉瑞亚像素世界——向导陪你写代码，真实对话、工具审批、难度切换，单文件零依赖。",
    repo = "https://github.com/10086ggqq/dsh_theme_terraria",
    homepage = "https://github.com/10086ggqq/dsh_theme_terraria",
    licenses = {"MIT"},
    authors = {"10086ggqq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-theme-terraria",

        versions = {
            ["0.1.0"] = { commit = "e463d164904e93ba3e693f67904ada9416aed40f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
