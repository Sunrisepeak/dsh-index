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
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@liustack/modlens",

        versions = {
            ["3.18.1"] = { commit = "2b71582435ff34a548efbefb74178ed133659ccb" },
            ["3.17.0"] = { commit = "7705546778c950c108ca60ec711f4023a7e7415b" },
            ["3.16.6"] = { commit = "28181920f6b064e33c6b235221e1a3a5d360a897" },
            ["3.11.0"] = { commit = "5faff399c64fb5979e60c0a52e1e212dbdab1a31" },
            ["3.9.1"] = { commit = "56045a985692ec5663e5757361e6c180648e6f04" },
        },
        latest = "3.18.1",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["3.11.0"] = {
                tarball = "modlens-3.11.0.tgz",
                sha256  = "07aad008656d591934970a48162e65b4ebf39aee1c8557f42e6a0f8e2bd59bb1",
                cn      = true,
            },
            ["3.9.1"] = {
                tarball = "modlens-3.9.1.tgz",
                sha256  = "76e8845e98c55769251988c3c3147aea81e7b7021e41bb96611446fbdfe30746",
                cn      = true,
            },
        },
    },
}
