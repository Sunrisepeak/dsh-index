package = {
    spec = "1",

    name = "dsh-node-nav",
    description = "对话节点导航：DSH Web GUI 右侧节点串，hover 预览、点击跳转、active 药丸跟随阅读位置",
    repo = "https://github.com/Seryta/dsh-node-nav",
    homepage = "https://github.com/Seryta/dsh-node-nav",
    licenses = {"MIT"},
    authors = {"Seryta"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-node-nav",

        versions = {
            ["0.2.2"] = { commit = "94a4bba9d0df1da6087c2fbab23c33ce8445d022" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
