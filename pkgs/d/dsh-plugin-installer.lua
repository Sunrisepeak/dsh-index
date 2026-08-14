package = {
    spec = "1",

    name = "dsh-plugin-installer",
    description = "A marketplace plugin to quickly integrate your DeepSeek Harness into the GitHub plugin ecosystem.",
    repo = "https://github.com/Toukaiteio/dsh-plugin-installer",
    homepage = "https://github.com/Toukaiteio/dsh-plugin-installer",
    licenses = {"MIT"},
    authors = {"Toukaiteio"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-installer",

        versions = {
            ["0.1.13"] = { commit = "97493a32c3713c707edb1534bf2b63346560c340" },
        },
        latest = "0.1.13",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
