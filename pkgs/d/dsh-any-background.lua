package = {
    spec = "1",

    name = "dsh-any-background",
    description = "一个自定义主题插件，包括背景图（大小和位置），主界面和设置界面（透明度，色轮全色主题色）插件",
    repo = "https://github.com/Tkingxiao/dsh-any-background",
    homepage = "https://github.com/Tkingxiao/dsh-any-background",
    licenses = {"MIT"},
    authors = {"Tkingxiao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-any-background",

        versions = {
            ["0.1.8"] = { commit = "5e4c0e0c3758c834422a6528ac26821ebf764b29" },
        },
        latest = "0.1.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
