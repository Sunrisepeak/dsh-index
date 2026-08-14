package = {
    spec = "1",

    name = "ds-api-usage",
    description = "ds-api-usage",
    repo = "https://github.com/Sev7een/ds-api-usage",
    homepage = "https://github.com/Sev7een/ds-api-usage",
    licenses = {"MIT"},
    authors = {"Sev7een"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-ds-api-usage",

        versions = {
            ["0.1.0"] = { commit = "b16fbf288ec72a714e71383a75679ba699c43ebc" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
