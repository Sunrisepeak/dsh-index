package = {
    spec = "1",

    name = "dsh-stock-watch",
    description = "A股自选股实时行情盯盘插件 - DeepSeek Harness Web 右上角可折叠弹窗",
    repo = "https://github.com/Awu12277/dsh-stock-watch",
    homepage = "https://github.com/Awu12277/dsh-stock-watch",
    licenses = {"MIT"},
    authors = {"Awu12277"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-stock-watch",

        versions = {
            ["1.0.6"] = { commit = "9abb2b7fcaf09124e181dd386f6ce91ec63aef82" },
        },
        latest = "1.0.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
