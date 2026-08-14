package = {
    spec = "1",

    name = "dsh-plugin-browser",
    description = "dsh-plugin-browser",
    repo = "https://github.com/CriscolTheCoder/dsh-plugin-browser",
    homepage = "https://github.com/CriscolTheCoder/dsh-plugin-browser",
    licenses = {"MIT"},
    authors = {"CriscolTheCoder"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-browser",

        versions = {
            ["0.2.0"] = { commit = "46384a9b8adb50fe9346052c54f04a33072f697f" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
