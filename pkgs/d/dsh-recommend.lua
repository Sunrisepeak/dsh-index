package = {
    spec = "1",

    name = "dsh-recommend",
    description = "DSH 插件生态透明排行与推荐：每日自动抓取 dsh-plugin 话题 + 公开评分模型 + 排行/推荐插件与静态站",
    repo = "https://github.com/zp-home/dsh-recommend",
    homepage = "https://github.com/zp-home/dsh-recommend",
    licenses = {"MIT"},
    authors = {"zp-home"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-recommend",

        versions = {
            ["0.2.0"] = { commit = "89b0f1000d7448373e1fe2131f1c58421fe1c300" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
