package = {
    spec = "1",

    name = "dsh-soul",
    description = "DSH experience compilation and evolution across eight harness components, with paired validation, trial activation, rollback and budget auditing.",
    repo = "https://github.com/icyaaaww/dsh-soul",
    homepage = "https://github.com/icyaaaww/dsh-soul",
    licenses = {"MIT"},
    authors = {"icyaaaww"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "dsh-soul",

        versions = {
            ["1.5.0"] = { commit = "8a953010bdc97b54cb6be2e9b3793ec7a81317a6" },
        },
        latest = "1.5.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
