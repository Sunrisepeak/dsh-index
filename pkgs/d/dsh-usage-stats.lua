package = {
    spec = "1",

    name = "dsh-usage-stats",
    description = "DeepSeek Harness 插件：GitHub 风格用量热力图 + Token / 缓存命中 / 账户余额看板 + 工作区别名管理。",
    repo = "https://github.com/Make0209/dsh-usage-stats",
    homepage = "https://github.com/Make0209/dsh-usage-stats",
    licenses = {"MIT"},
    authors = {"Make0209"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage-stats",

        versions = {
            ["1.0.0"] = { commit = "8992d306cdca8857b4362868d591fde3689765b0" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
