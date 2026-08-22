package = {
    spec = "1",

    name = "dsh-auto-collapse",
    description = "dsh-auto-collapse",
    repo = "https://github.com/a179-sanae/dsh-auto-collapse",
    homepage = "https://github.com/a179-sanae/dsh-auto-collapse",
    licenses = {"MIT"},
    authors = {"a179-sanae"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-auto-collapse",

        versions = {
            ["0.1.3"] = { commit = "2cc236a7e7ec964122521e1f5126af141ed1dca7" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
