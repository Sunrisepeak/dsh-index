package = {
    spec = "1",

    name = "dsh-jingling",
    description = "dsh · dsh-plugin · deepseek · deepseek-harness · deepseek-harness-plugin · ai-companion · desktop-pet · character-card · local-first · privacy · jingling · 鲸灵",
    repo = "https://github.com/Yi-111-a/dsh-jingling",
    homepage = "https://github.com/Yi-111-a/dsh-jingling",
    licenses = {"MIT"},
    authors = {"Yi-111-a"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-jingling",

        versions = {
            ["0.1.0-alpha.19"] = { commit = "c0fdb376551f67f11c08fe74e05221a848c5d6bc" },
        },
        latest = "0.1.0-alpha.19",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
