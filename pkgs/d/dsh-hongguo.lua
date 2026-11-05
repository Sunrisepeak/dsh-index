package = {
    spec = "1",

    name = "dsh-hongguo",
    description = "DSH plugin: watch Hongguo short dramas in the right sidebar while the agent works (built on openhongguo)",
    repo = "https://github.com/frostming/dsh-hongguo",
    homepage = "https://github.com/frostming/dsh-hongguo",
    authors = {"frostming"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-hongguo",

        versions = {
            ["1.0.0"] = { commit = "043c675d5d9b0d70b3e317257ab940d79fc05282" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
