package = {
    spec = "1",

    name = "cc-safety-net",
    description = "A pre-execution guard for AI coding agents. It blocks destructive Git and file system commands, plus common attempts to access sensitive files, before a tool call runs. Supports Amp Code, Antigravity CLI, Claude Code, Codex, Cursor, DeepSeek Harness, Gemini CLI, GitHub Copilot CLI, Grok Build, Hermes Agent, Kimi Code, OpenClaw, OpenCode, and Pi.",
    repo = "https://github.com/kenryu42/cc-safety-net",
    homepage = "https://github.com/kenryu42/cc-safety-net",
    licenses = {"MIT"},
    authors = {"kenryu42"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "cc-safety-net",

        versions = {
            ["2.5.1"] = { commit = "698846d4540896da285a906015c468a4e5eb95ca" },
        },
        latest = "2.5.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
