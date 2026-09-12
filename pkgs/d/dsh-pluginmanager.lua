package = {
    spec = "1",

    name = "dsh-pluginmanager",
    description = "DSH 分层插件管理器：原生插件按 系统层/WebUI 层/工具层 只读展示，用户扩展支持停用/启用、补登记、卸载与可编辑描述。",
    repo = "https://github.com/buhuikongpan/dsh-pluginmanager",
    homepage = "https://github.com/buhuikongpan/dsh-pluginmanager",
    authors = {"buhuikongpan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-pluginmanager",

        versions = {
            ["0.2.0"] = { commit = "de79f77748d0a60106650cfb37d9ce020663171d" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
