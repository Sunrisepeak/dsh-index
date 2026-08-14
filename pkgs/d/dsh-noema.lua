package = {
    spec = "1",

    name = "dsh-noema",
    description = "Noema long-term memory plugin for DSH: durable, inspectable agent memory with recall tools and a settings page.",
    repo = "https://github.com/ZSeven-W/dsh-noema",
    homepage = "https://github.com/ZSeven-W/dsh-noema",
    licenses = {"MIT"},
    authors = {"ZSeven-W"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zseven-w/dsh-noema",

        versions = {
            ["0.1.0-rc.1"] = { commit = "7ec68aa19bd879aaf7ff70773d2584fe43544871" },
        },
        latest = "0.1.0-rc.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
