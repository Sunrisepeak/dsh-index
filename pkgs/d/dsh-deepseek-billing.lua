package = {
    spec = "1",

    name = "dsh-deepseek-billing",
    description = "在 DSH 中查看 DeepSeek API 账户余额及计费信息",
    repo = "https://github.com/golitter/dsh-deepseek-billing",
    homepage = "https://github.com/golitter/dsh-deepseek-billing",
    authors = {"golitter"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deepseek-billing",

        versions = {
            ["0.1.0"] = { commit = "5ad31f1ffd4c5e5708e093c1ebb9b474c6929aa5" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
