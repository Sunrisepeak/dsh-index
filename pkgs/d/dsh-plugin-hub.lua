package = {
    spec = "1",

    name = "dsh-plugin-hub",
    description = "DeepSeek Harness (DSH) 插件管理面板：一键启用/停用插件 + GitHub dsh-plugin 插件市场，带插件详情与一键安装 | Plugin manager & marketplace for DeepSeek Harness",
    repo = "https://github.com/Noob-stupid/dsh-plugin-hub",
    homepage = "https://github.com/Noob-stupid/dsh-plugin-hub",
    licenses = {"MIT"},
    authors = {"Noob-stupid"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-plugin-console",

        versions = {
            ["0.1.0-rc.6"] = { commit = "4f4a5be6e44f2944cba0e168cff2ef1fb0ff4eb8" },
        },
        latest = "0.1.0-rc.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
