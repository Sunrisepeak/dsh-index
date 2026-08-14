package = {
    spec = "1",

    name = "dsh-humanizer",
    description = "DeepSeek Harness原生中文文本人工智能痕迹消除与多重审核对抗工作流",
    repo = "https://github.com/DEEP-IOS/dsh-humanizer",
    homepage = "https://github.com/DEEP-IOS/dsh-humanizer",
    licenses = {"MIT"},
    authors = {"DEEP-IOS"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-humanizer",

        versions = {
            ["0.1.0-rc.8"] = { commit = "673a5d91ed959ccf3a00bbdb1309dfddc6e7d0e3" },
        },
        latest = "0.1.0-rc.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
