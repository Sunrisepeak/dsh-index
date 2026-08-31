package = {
    spec = "1",

    name = "dsh-movein",
    description = "Migrate Claude Code setup into DeepSeek Harness. Import skills, commands, agents, hooks, permission rules, and MCP config. Codex and OpenCode supported.",
    repo = "https://github.com/sjh9714/dsh-movein",
    homepage = "https://github.com/sjh9714/dsh-movein",
    licenses = {"MIT"},
    authors = {"sjh9714"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-movein",

        versions = {
            ["0.13.6"] = { commit = "2d5437d9c41365696f8014608405b2cdad01179a" },
        },
        latest = "0.13.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
