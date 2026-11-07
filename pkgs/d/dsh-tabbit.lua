package = {
    spec = "1",

    name = "dsh-tabbit",
    description = "Tabbit Browser plugins for Deepseek Harness",
    repo = "https://github.com/Tabbit-Browser/dsh-tabbit",
    homepage = "https://github.com/Tabbit-Browser/dsh-tabbit",
    authors = {"Tabbit-Browser"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tabbit",

        versions = {
            ["0.2.2"] = { commit = "7b69a066973d4198d70d91368c7a5643ed7a57ce" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
