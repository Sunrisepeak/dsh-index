package = {
    spec = "1",

    name = "deja-vu",
    description = "Memory for coding agents built from the session history already on disk: Claude Code, Codex, Cursor, Copilot CLI, OpenClaw and 17 more. Search months of past sessions, including everything from before you installed it, and recall them in any agent. No LLM, no embeddings, one local Go binary.",
    repo = "https://github.com/vshulcz/deja-vu",
    homepage = "https://github.com/vshulcz/deja-vu",
    licenses = {"MIT"},
    authors = {"vshulcz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deja",

        versions = {
            ["0.20.5"] = { commit = "fae82b9963f68f6d319cfde745f854ad2e482726" },
        },
        latest = "0.20.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
