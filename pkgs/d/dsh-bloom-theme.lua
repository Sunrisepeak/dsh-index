package = {
    spec = "1",

    name = "dsh-bloom-theme",
    description = "DeepSeek Harness (DSH) 主题插件：Bloom 莫兰迪配色 4 变体，OKLCH 调色，明暗双主题，顶栏一键切换，全部达 WCAG AA",
    repo = "https://github.com/webkubor/dsh-bloom-theme",
    homepage = "https://github.com/webkubor/dsh-bloom-theme",
    licenses = {"MIT"},
    authors = {"webkubor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@kubor/dsh-bloom-theme",

        versions = {
            ["0.4.0"] = { commit = "37a75f64ef17a33f1b05eb58fb5fd4e08dfc0968" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
