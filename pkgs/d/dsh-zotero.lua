package = {
    spec = "1",

    name = "dsh-zotero",
    description = "Turn your Zotero library into an evidence store for agents.",
    repo = "https://github.com/Vncntvx/dsh-zotero",
    homepage = "https://github.com/Vncntvx/dsh-zotero",
    licenses = {"MIT"},
    authors = {"Vncntvx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-zotero",

        versions = {
            ["0.5.1"] = { commit = "3ea506ddaaf349dce362851bac52bcf273758bae" },
        },
        latest = "0.5.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
