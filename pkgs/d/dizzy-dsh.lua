package = {
    spec = "1",

    name = "dizzy-dsh",
    description = "My DSH plugins",
    repo = "https://github.com/Acidmoon/DIzzy-DSH",
    homepage = "https://github.com/Acidmoon/DIzzy-DSH",
    authors = {"Acidmoon"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dizzy-dsh",

        versions = {
            ["0.3.0"] = { commit = "65fbf21642e0cf46b2cc98308e5be66dec19354b" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
