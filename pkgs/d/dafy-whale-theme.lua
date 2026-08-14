package = {
    spec = "1",

    name = "dafy-whale-theme",
    description = "DeepSeek Harness 蓝色大肥鱼主题插件：海洋配色、鱼群、气泡、吉祥物与品牌替换",
    repo = "https://github.com/DViridescent/dafy-whale-theme",
    homepage = "https://github.com/DViridescent/dafy-whale-theme",
    licenses = {"MIT"},
    authors = {"DViridescent"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dafy-whale-theme",

        versions = {
            ["1.2.0"] = { commit = "99e8c571c40eee8d2e0599af8eddfcbf4f47fc89" },
        },
        latest = "1.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
