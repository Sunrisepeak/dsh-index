package = {
    spec = "1",

    name = "dsh-session-deeplink",
    description = "DeepSeek Harness plugin for shareable session deep links",
    repo = "https://github.com/R3alloc/dsh-session-deeplink",
    homepage = "https://github.com/R3alloc/dsh-session-deeplink",
    licenses = {"MIT"},
    authors = {"R3alloc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-deeplink",

        versions = {
            ["0.1.1"] = { commit = "f6250b6c5ec6bcc8a6f715b59d034664f409281e" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
