package = {
    spec = "1",

    name = "dsh-550c-boot",
    description = "550C 开机动画 for DeepSeek Harness — 首帧由宿主半边注入，DSH 的 Loading 卡片不露脸；桌面原生标题栏按钮收编成终端配色 | 550C boot splash plugin for DSH",
    repo = "https://github.com/yannicksong0106/dsh-550c-boot",
    homepage = "https://github.com/yannicksong0106/dsh-550c-boot",
    licenses = {"MIT"},
    authors = {"yannicksong0106"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-550c-boot",

        versions = {
            ["0.1.3"] = { commit = "58899caf18f938d1489ea0923a4018a61b673a97" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
