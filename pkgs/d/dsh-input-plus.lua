package = {
    spec = "1",

    name = "dsh-input-plus",
    description = "DSH Web UI plugin for workspace file references, prompt history, and lightweight composer enhancements.",
    repo = "https://github.com/WhitePlusMS/dsh-input-plus",
    homepage = "https://github.com/WhitePlusMS/dsh-input-plus",
    licenses = {"MIT"},
    authors = {"WhitePlusMS"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-input-plus",

        versions = {
            ["0.1.0"] = { commit = "cee1c7907e7f5ad1b38971d316d39c07d787967d" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
