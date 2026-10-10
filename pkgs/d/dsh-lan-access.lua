package = {
    spec = "1",

    name = "dsh-lan-access",
    description = "一个DSH局域网内访问插件：让 DeepSeek Harness 可在局域网内被其他设备访问的 DSH 插件。同一局域网下，手机/平板/电脑打开浏览器即可直接访问你某台设备上的 DSH——无需 SSH、无需内网穿透，npm 一键安装。",
    repo = "https://github.com/Leon0555/dsh-lan-access",
    homepage = "https://github.com/Leon0555/dsh-lan-access",
    licenses = {"MIT"},
    authors = {"Leon0555"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lan-access",

        versions = {
            ["0.1.3"] = { commit = "a2e173c5bca61127244c07917bd3132b853a2e1c" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
