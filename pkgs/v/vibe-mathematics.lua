package = {
    spec = "1",

    name = "vibe-mathematics",
    description = "Vibe Mathematics —— 多代理数学问题求解与形式化验证框架",
    repo = "https://github.com/ChongCyrus/Vibe-Mathematics",
    homepage = "https://github.com/ChongCyrus/Vibe-Mathematics",
    licenses = {"MIT"},
    authors = {"ChongCyrus"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-vibe-math",

        versions = {
            ["1.0.2"] = { commit = "50822814b21d93f2d739b041c21adda18413b5cb" },
        },
        latest = "1.0.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
