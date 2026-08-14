package = {
    spec = "1",

    name = "dsh-annotate",
    description = "Visual browser element annotation for DeepSeek Harness, capturing DOM, styles, accessibility data, comments, and viewport screenshots. DeepSeek Harness 浏览器元素标注插件，捕获 DOM、样式、可访问性数据、评论和视口截图。",
    repo = "https://github.com/BrambleXu/dsh-annotate",
    homepage = "https://github.com/BrambleXu/dsh-annotate",
    licenses = {"MIT"},
    authors = {"BrambleXu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-annotate",

        versions = {
            ["0.1.0"] = { commit = "43f39543f720d6f8851924f1387c797f04debd21" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
