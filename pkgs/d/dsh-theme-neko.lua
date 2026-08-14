package = {
    spec = "1",

    name = "dsh-theme-neko",
    description = "A Nachoneko (甘城猫猫) themed skin for the DeepSeek Harness web GUI.",
    repo = "https://github.com/drfccv/dsh-theme-neko",
    homepage = "https://github.com/drfccv/dsh-theme-neko",
    authors = {"drfccv"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-theme-neko",

        versions = {
            ["0.1.0"] = { commit = "6c7c9a58ff93cef7117cbfc3b48a295039cd7c45" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
