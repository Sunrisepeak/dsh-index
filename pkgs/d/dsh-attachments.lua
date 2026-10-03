package = {
    spec = "1",

    name = "dsh-attachments",
    description = "dsh-attachments",
    repo = "https://github.com/CocoSgt/dsh-attachments",
    homepage = "https://github.com/CocoSgt/dsh-attachments",
    authors = {"CocoSgt"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-attachments",

        versions = {
            ["0.1.1"] = { commit = "70c0b7e81d7d6a2707e282457bd92f2577bd6629" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
