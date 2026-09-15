package = {
    spec = "1",

    name = "weshop-dsh-plugin",
    description = "Native WeShop Cordis plugin for DeepSeek Harness. Allow you to use infinite canvas with infinite creative skills.",
    repo = "https://github.com/weshopai/weshop-dsh-plugin",
    homepage = "https://github.com/weshopai/weshop-dsh-plugin",
    licenses = {"MIT"},
    authors = {"weshopai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "weshop-dsh-plugin",

        versions = {
            ["1.0.1"] = { commit = "bb01658c4707ff9a5491903f324db22da74bab3e" },
        },
        latest = "1.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
