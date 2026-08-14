package = {
    spec = "1",

    name = "dsh-background",
    description = "DeepSeek Harness Web 背景图片插件:本地图片路径替换网页背景,外观设置行 + 实时预览",
    repo = "https://github.com/luoyu-xingu/dsh-background",
    homepage = "https://github.com/luoyu-xingu/dsh-background",
    licenses = {"MIT"},
    authors = {"luoyu-xingu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-background",

        versions = {
            ["0.2.9"] = { commit = "14980c518e7a64c37d1875af4a8be44feaa53f12" },
        },
        latest = "0.2.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
