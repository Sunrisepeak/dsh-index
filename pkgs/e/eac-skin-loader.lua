package = {
    spec = "1",

    name = "eac-skin-loader",
    description = "DSH UI Skin Loader / DSH UI 皮肤加载器",
    repo = "https://github.com/DSH-EAC/EAC-skin-loader",
    homepage = "https://github.com/DSH-EAC/EAC-skin-loader",
    licenses = {"MIT"},
    authors = {"DSH-EAC"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-eac/skin-loader-pack",

        versions = {
            ["1.2.0"] = { commit = "43e9236c162332058754c7e84dc76aefa8ac40b7" },
        },
        latest = "1.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
