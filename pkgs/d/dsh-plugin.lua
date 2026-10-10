package = {
    spec = "1",

    name = "dsh-plugin",
    description = "Tabbit Broser plugins for Deepseek Harness",
    repo = "https://github.com/Tabbit-Browser/dsh-plugin",
    homepage = "https://github.com/Tabbit-Browser/dsh-plugin",
    authors = {"Tabbit-Browser"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "tabbit-browser",

        versions = {
            ["0.1.0"] = { commit = "80e2f5726b0eac01f4dd32a3f6e451504881bcb3" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
