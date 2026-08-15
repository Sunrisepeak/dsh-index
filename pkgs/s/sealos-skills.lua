package = {
    spec = "1",

    name = "sealos-skills",
    description = "AI agent skills for Sealos — deploy any project, provision databases, object storage & more with one command. Works with Claude Code, Gemini CLI, Codex.",
    repo = "https://github.com/labring/sealos-skills",
    homepage = "https://github.com/labring/sealos-skills",
    authors = {"labring"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "sealos",

        versions = {
            ["1.2.5"] = { commit = "f6876f7df876eac3617ddc15f95f43dcb8c33e31" },
        },
        latest = "1.2.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
