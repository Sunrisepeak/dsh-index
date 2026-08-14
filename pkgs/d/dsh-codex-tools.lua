package = {
    spec = "1",

    name = "dsh-codex-tools",
    description = "dsh-codex-tools",
    repo = "https://github.com/SPYQWER1/dsh-codex-tools",
    homepage = "https://github.com/SPYQWER1/dsh-codex-tools",
    licenses = {"MIT"},
    authors = {"SPYQWER1"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-codex-tools",

        versions = {
            ["1.0.0"] = { commit = "6da8a204359e7822308845d755122cb1024b91a9" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
