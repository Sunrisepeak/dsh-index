package = {
    spec = "1",

    name = "dsh-whale-pet",
    description = "dsh-whale-pet",
    repo = "https://github.com/lglglglgy/dsh-whale-pet",
    homepage = "https://github.com/lglglglgy/dsh-whale-pet",
    authors = {"lglglglgy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-pet",

        versions = {
            ["0.1.0"] = { commit = "ff36eef5900d30d5d9709bcd21155cf583e71cb7" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
