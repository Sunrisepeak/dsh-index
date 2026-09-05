package = {
    spec = "1",

    name = "dsh-claude-move",
    description = "Four-source migration wizard for DeepSeek Harness: move Claude Code, Codex, OpenCode and Hermes sessions, memories, skills, instructions and slash commands into DSH (/move wizard + resumable sessions, approval-gated, idempotent).",
    repo = "https://github.com/PerryLink/dsh-claude-move",
    homepage = "https://github.com/PerryLink/dsh-claude-move",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-claude-move",

        versions = {
            ["0.3.0"] = { commit = "c74b1365d9f536e0f875a02ebcca8cf5cf10a123" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
