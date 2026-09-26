package = {
    spec = "1",

    name = "dsh-lovelyaudit",
    description = "DSH web plugin: 黑盒/代审 sidebar workspace (P0–P7, per-finding SRC reports).",
    repo = "https://github.com/Tokeii0/dsh-lovelyaudit",
    homepage = "https://github.com/Tokeii0/dsh-lovelyaudit",
    authors = {"Tokeii0"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lovelyaudit",

        versions = {
            ["0.2.1"] = { commit = "89de08c2865485105c6e501075b8cd8708236a6f" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
