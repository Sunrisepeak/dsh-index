package = {
    spec = "1",

    name = "touhou-hakurei",
    description = "灵梦（Reimu）·博丽神社（东方Project）美化版皮肤：神社昼夜实景背景、灵梦立绘、画框侧边栏与输入框、纸白透明界面 — DeepSeek Harness Web GUI skin",
    repo = "https://github.com/xiake595/touhou-hakurei",
    homepage = "https://github.com/xiake595/touhou-hakurei",
    authors = {"xiake595"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-client-ui-skin-hakurei-shrine",

        versions = {
            ["0.1.0"] = { commit = "2193bcf0bbfb6e8aa14e69bd3d618eda97307dde" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
