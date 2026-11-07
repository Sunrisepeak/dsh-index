package = {
    spec = "1",

    name = "dsh-plugin-save-token",
    description = "A DeepSeek Harness (dsh) dynamic plugin that cuts token cost without cutting model intelligence",
    repo = "https://github.com/vibe-any/dsh-plugin-save-token",
    homepage = "https://github.com/vibe-any/dsh-plugin-save-token",
    licenses = {"MIT"},
    authors = {"vibe-any"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-save-token",

        versions = {
            ["2.4.1"] = { commit = "e241dbc23288d7d1b6865cf726c8e777c4ce7e08" },
        },
        latest = "2.4.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
