package = {
    spec = "1",

    name = "dsh-user-plugins-manager",
    description = "DSH 用户插件管理器:在 设置→插件 统一管理插件目录散件、运行树插件与 npm 插件包——挂载/卸载/启用/停用(cordis.patch.yml 补丁层 + HMR 热生效)",
    repo = "https://github.com/zdjmrq/dsh-user-plugins-manager",
    homepage = "https://github.com/zdjmrq/dsh-user-plugins-manager",
    licenses = {"MIT"},
    authors = {"zdjmrq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-user-plugins-manager",

        versions = {
            ["1.2.3"] = { commit = "c09d93a142164f59346f19700c2a798a57203583" },
        },
        latest = "1.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
