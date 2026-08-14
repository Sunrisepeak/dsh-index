package = {
    spec = "1",

    name = "dsh-thinking-status-customizer",
    description = "Customize the visible DSH Web thinking status with lifecycle-safe CSS.",
    repo = "https://github.com/Dbi-Eshuh/dsh-thinking-status-customizer",
    homepage = "https://github.com/Dbi-Eshuh/dsh-thinking-status-customizer",
    licenses = {"MIT"},
    authors = {"Dbi-Eshuh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-thinking-status-customizer",

        versions = {
            ["0.1.0"] = { commit = "3edab129bf7474093d634e9cfac2e5314161aa31" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
