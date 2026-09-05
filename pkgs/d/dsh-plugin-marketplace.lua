package = {
    spec = "1",

    name = "dsh-plugin-marketplace",
    description = "Verified plugin marketplace and autonomous registry for DeepSeek Harness",
    repo = "https://github.com/YELEBAI/dsh-plugin-marketplace",
    homepage = "https://github.com/YELEBAI/dsh-plugin-marketplace",
    licenses = {"MIT"},
    authors = {"YELEBAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-marketplace",

        versions = {
            ["0.6.1"] = { commit = "6a35c8bdfce0d4c906fa56efea880fdbf06d5dea" },
        },
        latest = "0.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
