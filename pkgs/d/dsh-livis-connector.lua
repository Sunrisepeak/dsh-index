package = {
    spec = "1",

    name = "dsh-livis-connector",
    description = "Connect Livis to DeepSeek Harness with in-app authorization and relay management.",
    repo = "https://github.com/fyy99/dsh-livis-connector",
    homepage = "https://github.com/fyy99/dsh-livis-connector",
    licenses = {"MIT"},
    authors = {"fyy99"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-livis-connector",

        versions = {
            ["0.1.0"] = { commit = "40df2eb3b7742d0905d93898baf20661e8c03f78" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
