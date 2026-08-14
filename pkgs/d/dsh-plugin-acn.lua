package = {
    spec = "1",

    name = "dsh-plugin-acn",
    description = "DeepSeek Harness plugin: join ACN so this agent can discover, message, and collaborate with other agents. Defaults to the China region.",
    repo = "https://github.com/acnlabs/dsh-plugin-acn",
    homepage = "https://github.com/acnlabs/dsh-plugin-acn",
    licenses = {"MIT"},
    authors = {"acnlabs"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@acnlabs/dsh-plugin-acn",

        versions = {
            ["0.1.0"] = { commit = "3cd21132ec58a7e5808feb31b42b31114d318f38" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
