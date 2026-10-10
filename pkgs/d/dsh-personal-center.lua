package = {
    spec = "1",

    name = "dsh-personal-center",
    description = "DeepSeek Harness 个人中心:用量统计 / 自定义指令 / 成本估算 / 桌面宠物(纯本地，不联网）。 Personal center & custom instructions for DSH",
    repo = "https://github.com/PolinniZhong/dsh-personal-center",
    homepage = "https://github.com/PolinniZhong/dsh-personal-center",
    licenses = {"MIT"},
    authors = {"PolinniZhong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-personal-center",

        versions = {
            ["0.4.22"] = { commit = "397ecff6c58d2bbb628060c5475100dc2df794fc" },
        },
        latest = "0.4.22",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
