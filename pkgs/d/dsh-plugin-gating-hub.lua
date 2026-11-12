package = {
    spec = "1",

    name = "dsh-plugin-gating-hub",
    description = "DeepSeek Harness (DSH) 插件管理面板：一键启用/停用插件 + GitHub dsh-plugin 插件市场+自定义插件索引/市场，带插件详情与一键安装，一键框架升级自动回滚,插件升级门控 | Plugin manager & marketplace for DeepSeek Harness",
    repo = "https://github.com/Noob-stupid/dsh-plugin-gating-hub",
    homepage = "https://github.com/Noob-stupid/dsh-plugin-gating-hub",
    licenses = {"MIT"},
    authors = {"Noob-stupid"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@noob-stupid/dsh-plugin-console",

        versions = {
            ["0.3.46"] = { commit = "7c07f62def0be768c860eeaf55218246784c0bc6" },
        },
        latest = "0.3.46",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
