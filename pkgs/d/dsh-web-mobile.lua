package = {
    spec = "1",

    name = "dsh-web-mobile",
    description = "DeepSeek Harness Web UI 移动端适配插件:窄屏下侧边栏变为 overlay 抽屉,会话独占全宽。",
    repo = "https://github.com/mexiaosqwq/dsh-web-mobile",
    homepage = "https://github.com/mexiaosqwq/dsh-web-mobile",
    licenses = {"MIT"},
    authors = {"mexiaosqwq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-mobile-nav",

        versions = {
            ["0.2.0"] = { commit = "462331952aae562db160efb579fca5ae13837f40" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
