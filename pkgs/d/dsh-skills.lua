package = {
    spec = "1",

    name = "dsh-skills",
    description = "dsh-skills",
    repo = "https://github.com/CocoSgt/dsh-skills",
    homepage = "https://github.com/CocoSgt/dsh-skills",
    authors = {"CocoSgt"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skills",

        versions = {
            ["0.1.1"] = { commit = "e1eff623f3bd3e6c26a24d49a9ac953e28778cc9" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
