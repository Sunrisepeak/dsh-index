package = {
    spec = "1",

    name = "modlens",
    description = "CLI toolkit for AI agents — converts images into structured JSON evidence (OCR, layout, semantics), bridging t",
    repo = "https://github.com/liustack/modlens",
    homepage = "https://github.com/liustack/modlens",
    licenses = {"MIT"},
    authors = {"liustack"},

    status = "dev",
    categories = {"dsh-plugin", "vision", "skills"},
    keywords = {"dsh", "agent-skills", "agentic-workflow", "claude-code", "claude-skills", "codex", "cordis", "glm", "harness-engineering"},

    dsh = {
        bundle_name = "@liustack/modlens",

        versions = {
            ["3.9.1"] = { commit = "56045a985692ec5663e5757361e6c180648e6f04" },
        },
        latest = "3.9.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
