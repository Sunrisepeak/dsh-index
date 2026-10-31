package = {
    spec = "1",

    name = "dsh-plugin-session-delete",
    description = "Delete DeepSeek Harness sessions from the UI: header danger button + sidebar session-row menu item (no conversation jump), risk-consent dialog with session name/id, stops running agents first, in-place list refresh without page reload. Works in web and the desktop client.",
    repo = "https://github.com/lsz-asd/dsh-plugin-session-delete",
    homepage = "https://github.com/lsz-asd/dsh-plugin-session-delete",
    authors = {"lsz-asd"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@huanlin/dsh-plugin-session-delete",

        versions = {
            ["0.3.1"] = { commit = "352510e552983dcfcb993cf9124181c55e2070f5" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
