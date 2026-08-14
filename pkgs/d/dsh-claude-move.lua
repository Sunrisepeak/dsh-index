package = {
    spec = "1",

    name = "dsh-claude-move",
    description = "DeepSeek Harness (dsh) plugin: migrate Claude Code sessions, memory, skills and CLAUDE.md into DSH with seamless resume (claude_scan / import_claude / resume-claude / web panel)",
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
            ["0.1.0"] = { commit = "1c00376ba5dab1351d07dbabe81b266fa302ff1b" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
