package = {
    spec = "1",

    name = "dsh-tavern",
    description = "A plugin which makes dsh compatible with SillyTavern artifacts.",
    repo = "https://github.com/Player-MINEPIG/dsh-tavern",
    homepage = "https://github.com/Player-MINEPIG/dsh-tavern",
    licenses = {"MIT"},
    authors = {"Player-MINEPIG"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tavern",

        versions = {
            ["0.1.0"] = { commit = "5621c38566255b4f523fe0abc39216e2c49dd9f2" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
