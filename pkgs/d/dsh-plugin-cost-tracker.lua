package = {
    spec = "1",

    name = "dsh-plugin-cost-tracker",
    description = "Token cost tracker for DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-cost-tracker",
    homepage = "https://github.com/YYTbit/dsh-plugin-cost-tracker",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-cost-tracker",

        versions = {
            ["0.1.0"] = { commit = "4e861a1ac0304ab027f903e195bff7107e3022a7" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
