package = {
    spec = "1",

    name = "dsh-theme-endfield",
    description = "终末地官网风格的 DSH Web 主题：奶油纸底、墨黑文字、信号黄强调、全直角工业编辑风。",
    repo = "https://github.com/ymh0000123/dsh-theme-endfield",
    homepage = "https://github.com/ymh0000123/dsh-theme-endfield",
    licenses = {"MIT"},
    authors = {"ymh0000123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-theme-endfield",

        versions = {
            ["1.0.0"] = { commit = "5d4097d52fcd4480e93f9bf520bb48f249507d50" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
