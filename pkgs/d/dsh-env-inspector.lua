package = {
    spec = "1",

    name = "dsh-env-inspector",
    description = "DSH 环境自检：让读者看到自己电脑装了什么 —— 系统/CLI/DSH 插件/秘钥是否存在",
    repo = "https://github.com/webkubor/dsh-env-inspector",
    homepage = "https://github.com/webkubor/dsh-env-inspector",
    licenses = {"MIT"},
    authors = {"webkubor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-plugins/dsh-env-inspector",

        versions = {
            ["0.2.8"] = { commit = "90add59c033a45a46c8cf643613d85b8d48281fb" },
        },
        latest = "0.2.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
