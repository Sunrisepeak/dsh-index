package = {
    spec = "1",

    name = "agy-staff",
    description = "Hire Google's Antigravity CLI (agy) as a fast Gemini staffer for Claude Code, OpenAI Codex, and DeepSeek Harness.",
    repo = "https://github.com/keli-wen/agy-staff",
    homepage = "https://github.com/keli-wen/agy-staff",
    licenses = {"MIT"},
    authors = {"keli-wen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "agy-staff",

        versions = {
            ["0.9.0"] = { commit = "1f66a8d21adeccba74939924c4dbb40a37f852e1" },
        },
        latest = "0.9.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
