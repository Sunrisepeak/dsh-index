package = {
    spec = "1",

    name = "dsh-codex-sync",
    description = "One-tap Codex move-in to DSH: auto-import project chats, two-way Skills & MCP sync.",
    repo = "https://github.com/Walvez/dsh-codex-sync",
    homepage = "https://github.com/Walvez/dsh-codex-sync",
    licenses = {"MIT"},
    authors = {"Walvez"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-codex-sync",

        versions = {
            ["0.9.5"] = { commit = "8916b56ef4e2d1273e847e6fc6a20c25d0b2db9b" },
        },
        latest = "0.9.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
