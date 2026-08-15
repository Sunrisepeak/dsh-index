package = {
    spec = "1",

    name = "dsh-better-sidebar",
    description = "一个侧边栏的完整工作台，支持三方拓展注册新侧边栏页面。内置文件渲染编辑/终端/Git/子代理",
    repo = "https://github.com/omdsh-dev/DSH-better-sidebar",
    homepage = "https://github.com/omdsh-dev/DSH-better-sidebar",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-better-sidebar",

        versions = {
            ["0.12.1"] = { commit = "2bace68af8fa092a9a75070231bbf3488ee55a6b" },
        },
        latest = "0.12.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
