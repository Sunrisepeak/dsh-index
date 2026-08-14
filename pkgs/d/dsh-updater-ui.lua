package = {
    spec = "1",

    name = "dsh-updater-ui",
    description = "dsh-updater-ui",
    repo = "https://github.com/xingyingyuzhui/dsh-updater-ui",
    homepage = "https://github.com/xingyingyuzhui/dsh-updater-ui",
    licenses = {"MIT"},
    authors = {"xingyingyuzhui"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-updater-ui",

        versions = {
            ["1.0.0"] = { commit = "bf3077254e1e47d92eb6d569c6d43d1a8c3b8bf0" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
