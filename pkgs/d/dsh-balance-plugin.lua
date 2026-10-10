package = {
    spec = "1",

    name = "dsh-balance-plugin",
    description = "deepSeek 余额监控与用量统计（DSH 动态 Cordis 插件）：余额监控 · 官方充值入口 · 用量统计 · 三方插件管理",
    repo = "https://github.com/Francis-Xavier-code/dsh-balance-plugin",
    homepage = "https://github.com/Francis-Xavier-code/dsh-balance-plugin",
    licenses = {"MIT"},
    authors = {"Francis-Xavier-code"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-balance-plugin",

        versions = {
            ["1.0.0"] = { commit = "9de5114a03123f5a9f4208a3c8f90f93baaa7c0e" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
