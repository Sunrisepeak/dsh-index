package = {
    spec = "1",

    name = "dsh-undo-plugin",
    description = "DSH crash-rescue plugin: undo config & plugin-code changes, secret-safe snapshots, one-click SAFE MODE, plus offline CLI/GUI that work even when DSH won't boot.",
    repo = "https://github.com/lire1131/dsh-undo-plugin",
    homepage = "https://github.com/lire1131/dsh-undo-plugin",
    licenses = {"MIT"},
    authors = {"lire1131"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-undo-savepoint",

        versions = {
            ["0.3.2"] = { commit = "6bb71c1fd700ec56611d02cebf370d47f8657284" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
