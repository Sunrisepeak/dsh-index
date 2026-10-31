package = {
    spec = "1",

    name = "dsh-piggy",
    description = "🐖 DeepSeek Harness 养成插件，也可作为 Windows/Linux/macOS 桌面宠物运行；支持成长、学习、打工、钓鱼、图鉴与换肤",
    repo = "https://github.com/CLICGGER-TYPES/dsh-piggy",
    homepage = "https://github.com/CLICGGER-TYPES/dsh-piggy",
    authors = {"CLICGGER-TYPES"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-piggy",

        versions = {
            ["0.37.0"] = { commit = "c20ab95f7d088bc452ffe016f209a95b40681d48" },
        },
        latest = "0.37.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
