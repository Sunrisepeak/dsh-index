package = {
    spec = "1",

    name = "dsh-turn-delete",
    description = "Delete one complete turn from a DeepSeek Harness session without deleting the session",
    repo = "https://github.com/hanshenmesen/dsh-turn-delete",
    homepage = "https://github.com/hanshenmesen/dsh-turn-delete",
    licenses = {"MIT"},
    authors = {"hanshenmesen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-turn-delete",

        versions = {
            ["0.1.0"] = { commit = "4716bcbdee27b110ceea9df21f027c6dfe5888b8" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
