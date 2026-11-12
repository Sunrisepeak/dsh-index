package = {
    spec = "1",

    name = "dsh-import-agents",
    description = "Import pi / opencode / codex / claude-code sessions, chat history, and agents into DeepSeek Harness — one-click Sync button, slash commands, session-start migration prompt",
    repo = "https://github.com/Chang-Tong/dsh-import-agents",
    homepage = "https://github.com/Chang-Tong/dsh-import-agents",
    licenses = {"MIT"},
    authors = {"Chang-Tong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-import-agents",

        versions = {
            ["0.2.6"] = { commit = "df54e0079f9bb95f580c2249914e2a39e576a67d" },
        },
        latest = "0.2.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
