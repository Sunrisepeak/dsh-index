package = {
    spec = "1",

    name = "dsh-claude-marketplace",
    description = "Claude Code marketplace compatibility for DeepSeek Harness",
    repo = "https://github.com/ben7am1n/dsh-claude-marketplace",
    homepage = "https://github.com/ben7am1n/dsh-claude-marketplace",
    licenses = {"MIT"},
    authors = {"ben7am1n"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-claude-marketplace",

        versions = {
            ["0.1.1"] = { commit = "0e57e155c44621150962e733b9677328bd4fa656" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
