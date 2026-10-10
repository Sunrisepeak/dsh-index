package = {
    spec = "1",

    name = "dsh-preset-plus",
    description = "DSH 预设编辑器插件, 支持一键破甲.",
    repo = "https://github.com/Rain-kl/dsh-preset-plus",
    homepage = "https://github.com/Rain-kl/dsh-preset-plus",
    licenses = {"MIT"},
    authors = {"Rain-kl"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@rain-kl/dsh-preset-plus",

        versions = {
            ["0.1.3"] = { commit = "7623b1132d00eccd92e6fda2907ff6021b8b04ce" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
