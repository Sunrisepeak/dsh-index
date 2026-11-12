package = {
    spec = "1",

    name = "dsh-delete-chat",
    description = "dsh-delete-chat",
    repo = "https://github.com/youqu68/dsh-delete-chat",
    homepage = "https://github.com/youqu68/dsh-delete-chat",
    licenses = {"MIT"},
    authors = {"youqu68"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-delete-chat",

        versions = {
            ["0.1.1"] = { commit = "59ed2135e04683059fd580ec55bf2caeb2771daa" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
