package = {
    spec = "1",

    name = "dsh-usage-dashboard",
    description = "DeepSeek 额度与用量仪表盘 — DSH (DeepSeek Harness) 动态 Cordis 插件",
    repo = "https://github.com/Cassius0924/dsh-usage-dashboard",
    homepage = "https://github.com/Cassius0924/dsh-usage-dashboard",
    licenses = {"MIT"},
    authors = {"Cassius0924"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage-dashboard",

        versions = {
            ["0.2.0"] = { commit = "aa1be0f6b1603d4a4ad47d96708e7e3f0aacfe9f" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
