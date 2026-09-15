package = {
    spec = "1",

    name = "dsh-mobile-hanui",
    description = "基于deepseek-harness（dsh）的手机网页优化插件，修复了部分网页与手机端不适配的问题；",
    repo = "https://github.com/Z-6354/dsh-mobile-hanui",
    homepage = "https://github.com/Z-6354/dsh-mobile-hanui",
    licenses = {"MIT"},
    authors = {"Z-6354"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mobile-hanui",

        versions = {
            ["0.2.5"] = { commit = "27f11e7b7925fafcd63926dfefde11cfc1197cf3" },
        },
        latest = "0.2.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
