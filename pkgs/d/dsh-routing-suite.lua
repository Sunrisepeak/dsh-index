package = {
    spec = "1",

    name = "dsh-routing-suite",
    description = "Lightweight, localized task routing for DeepSeek Harness",
    repo = "https://github.com/dragonbaba/dsh-routing-suite",
    homepage = "https://github.com/dragonbaba/dsh-routing-suite",
    licenses = {"MIT"},
    authors = {"dragonbaba"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-routing-suite",

        versions = {
            ["0.1.2"] = { commit = "436bab5ff0a2346602591dbc67a43f723f6b67a8" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
