package = {
    spec = "1",

    name = "dsh-skin-appearance",
    description = "DeepSeek Harness 外观定制插件：八套内置主题 + 自定义壁纸（透明度/模糊），Host 设置持久化 | Appearance plugin for dsh web",
    repo = "https://github.com/Vim0x3c/dsh-skin-appearance",
    homepage = "https://github.com/Vim0x3c/dsh-skin-appearance",
    licenses = {"MIT"},
    authors = {"Vim0x3c"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skin-appearance",

        versions = {
            ["0.1.0"] = { commit = "be7b05776c1dee9e3d387e122c42005edf400837" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
