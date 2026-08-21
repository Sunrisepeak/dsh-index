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
            ["0.14.1"] = { commit = "50a888845fc614f63dfbf4d2b3704cc1004cd5c0" },
            ["0.14.0"] = { commit = "6c891514b544b6e2da51fdab2eb3436cc02da246" },
            ["0.13.1"] = { commit = "4a407d78b8a9ffda6bde1c4bf699ac6846ffd1d9" },
            ["0.13.0"] = { commit = "5e416eccef277067a4e4b9d655044e8bc45b243c" },
            ["0.12.3"] = { commit = "c923fc57b1a64b898d8b6d1bcc76cfb941831255" },
            ["0.12.2"] = { commit = "ecebc978009362ae90c64d9f07d3c518d4651dd9" },
            ["0.12.1"] = { commit = "2bace68af8fa092a9a75070231bbf3488ee55a6b" },
        },
        latest = "0.14.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
