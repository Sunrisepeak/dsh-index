package = {
    spec = "1",

    name = "vision-exp-tile",
    description = "DSH 插件：大图切 800×800 无损小块 + 坐标标注 + 分块聚合逻辑，直连 deepseek-v4-flash-vision-exp 识别；仅用纯官方 DSH 功能，零依赖第三方插件，不统计 token/费用。",
    repo = "https://github.com/Nicholas023/vision-exp-tile",
    homepage = "https://github.com/Nicholas023/vision-exp-tile",
    licenses = {"MIT"},
    authors = {"Nicholas023"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "vision-test",

        bundle_name = "vision-exp-tile",

        versions = {
            ["0.4.2"] = { commit = "100ca1c5122c11958e3fc0e53b879b7e98a70137" },
        },
        latest = "0.4.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
