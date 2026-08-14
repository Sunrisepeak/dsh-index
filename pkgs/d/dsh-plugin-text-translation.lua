package = {
    spec = "1",

    name = "dsh-plugin-text-translation",
    description = "DSH plugin: text & document localization with tag-protected extraction, batch slicing and lossless assembly (game scripts + long documents)",
    repo = "https://github.com/1738348785/dsh-plugin-text-translation",
    homepage = "https://github.com/1738348785/dsh-plugin-text-translation",
    licenses = {"MIT"},
    authors = {"1738348785"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-text-translation",

        versions = {
            ["1.0.0"] = { commit = "0d15e07e03ef0a47dd418ec35bb0c41e5bcb250e" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
