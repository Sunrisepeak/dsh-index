package = {
    spec = "1",

    name = "dsh-web-lan-access",
    description = "DeepSeek Harness (dsh) Web plugin",
    repo = "https://github.com/AcidGr/dsh-web-lan-access",
    homepage = "https://github.com/AcidGr/dsh-web-lan-access",
    licenses = {"MIT"},
    authors = {"AcidGr"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-lan-access",

        versions = {
            ["1.1.0"] = { commit = "e27e909f2f079d2213c13823f56fe9ade4726f80" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
