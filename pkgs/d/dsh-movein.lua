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
            ["0.12.1"] = { commit = "bd7c69b0786dac7c5ba064dfc0f6cf9bf0542806" },
        },
        latest = "0.12.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
