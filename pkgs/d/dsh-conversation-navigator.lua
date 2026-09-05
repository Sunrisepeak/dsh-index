package = {
    spec = "1",

    name = "dsh-conversation-navigator",
    description = "DSH 会话导航",
    repo = "https://github.com/gjj-star/dsh-conversation-navigator",
    homepage = "https://github.com/gjj-star/dsh-conversation-navigator",
    licenses = {"MIT"},
    authors = {"gjj-star"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-conversation-navigator",

        versions = {
            ["0.2.0"] = { commit = "32e37a5827e796b2f635c7d4368aed88946ae82d" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
