package = {
    spec = "1",

    name = "dsh-expression",
    description = "找得到、发得出 —— DSH 表情包插件：语义搜图，只发真实文件，走 companion QQ 通道",
    repo = "https://github.com/yyh-001/dsh-expression",
    homepage = "https://github.com/yyh-001/dsh-expression",
    licenses = {"MIT"},
    authors = {"yyh-001"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-expression",

        versions = {
            ["0.1.2"] = { commit = "227604955e88b42dcbbe09430399fe6fd472a9cb" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
