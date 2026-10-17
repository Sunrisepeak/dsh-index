package = {
    spec = "1",

    name = "dsh-wallpaper-engine",
    description = "一个插件让你的dsh可以自由切换你的wallpaper engine里面的壁纸资源，还可以通过多个滑动条来控制透壁纸的模糊程度，亮度，边框，以及对话框的液态玻璃效果，让你的dsh更加美观",
    repo = "https://github.com/elysia395/dsh-wallpaper-engine",
    homepage = "https://github.com/elysia395/dsh-wallpaper-engine",
    authors = {"elysia395"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-wallpaper-engine",

        versions = {
            ["0.1.5"] = { commit = "f275c2c68ee316b34fab8cb1ab0351ec3c29d506" },
        },
        latest = "0.1.5",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
