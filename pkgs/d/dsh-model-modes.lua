package = {
    spec = "1",

    name = "dsh-model-modes",
    description = "Capability-aware reasoning controls and Fast model routing for DeepSeek Harness",
    repo = "https://github.com/DTSFO/dsh-model-modes",
    homepage = "https://github.com/DTSFO/dsh-model-modes",
    licenses = {"MIT"},
    authors = {"DTSFO"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-model-modes",

        versions = {
            ["0.1.2"] = { commit = "dbc7d2b35b39d5f44d443ecdeadfdfc3816b6514" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
