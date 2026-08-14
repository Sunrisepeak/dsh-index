package = {
    spec = "1",

    name = "dsh-undo-plugin",
    description = "DSH plugin: snapshot & rollback your plugin/skin/settings configs. Auto-save on change, undo/redo stack, snapshot manager panel, keyboard shortcuts, plus an offline PowerShell CLI & GUI that work even when DSH won't boot.",
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
            ["0.1.0"] = { commit = "020d45ba4a4b8ab8d9be5d565e879c6977b53c85" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
