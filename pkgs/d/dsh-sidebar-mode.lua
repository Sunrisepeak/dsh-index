package = {
    spec = "1",

    name = "dsh-sidebar-mode",
    description = "把默认的四种模式切换塞进「新会话」按钮里，新会话创建更方便（标准/PTC/创造/极简，与设置双向同步）",
    repo = "https://github.com/Meredith2328/dsh-sidebar-mode",
    homepage = "https://github.com/Meredith2328/dsh-sidebar-mode",
    licenses = {"MIT"},
    authors = {"Meredith2328"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-sidebar-mode",

        versions = {
            ["0.2.4"] = { commit = "d90ac70efcd49958afad3ccc1ed016eed05a61b5" },
        },
        latest = "0.2.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
