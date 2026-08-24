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
            ["0.3.19"] = { commit = "3370884f71b2e282a13a33d54325b20617296695" },
            ["0.3.17"] = { commit = "d6bfa0f61b188a2e5cfa5ac09a894691f5ac1a4a" },
            ["0.3.13"] = { commit = "3e5c97371a652a604c2e374a12c05c2629433735" },
            ["0.1.0-rc.6"] = { commit = "4f4a5be6e44f2944cba0e168cff2ef1fb0ff4eb8" },
        },
        latest = "0.3.19",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
