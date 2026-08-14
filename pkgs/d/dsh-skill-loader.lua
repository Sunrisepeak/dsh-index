package = {
    spec = "1",

    name = "dsh-skill-loader",
    description = "dsh-skill-loader",
    repo = "https://github.com/kezboardpj/dsh-skill-loader",
    homepage = "https://github.com/kezboardpj/dsh-skill-loader",
    licenses = {"MIT"},
    authors = {"kezboardpj"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skill-loader",

        versions = {
            ["0.2.0"] = { commit = "edec4f5a98cfc9e5c5905b57ddea0369ee6dc60a" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
