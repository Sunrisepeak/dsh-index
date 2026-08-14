package = {
    spec = "1",

    name = "dsh-outdoor-theme",
    description = "DSH 户外皮肤 · 山野向导（Trail Guide）",
    repo = "https://github.com/Estellalee/dsh-outdoor-theme",
    homepage = "https://github.com/Estellalee/dsh-outdoor-theme",
    licenses = {"MIT"},
    authors = {"Estellalee"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-outdoor-theme",

        versions = {
            ["2.0.0"] = { commit = "236e5426f9a833191dd57758caef1fcd076d51ad" },
        },
        latest = "2.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
