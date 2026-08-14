package = {
    spec = "1",

    name = "dsh-plugin-manager",
    description = "DSH 插件管理, 一键启用/禁用插件",
    repo = "https://github.com/monk233/dsh-plugin-manager",
    homepage = "https://github.com/monk233/dsh-plugin-manager",
    licenses = {"MIT"},
    authors = {"monk233"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-plugin-manager",

        versions = {
            ["0.1.0"] = { commit = "1dd43f77a8962504916baeb9f0a03d1f6246cd60" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
