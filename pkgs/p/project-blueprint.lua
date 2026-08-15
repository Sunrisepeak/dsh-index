package = {
    spec = "1",

    name = "project-blueprint",
    description = "Make any project AI-agent-ready in one command. Adaptive tech stack detection (7 languages × 14 frameworks × 61 components), auto-generates AGENTS.md, docs skeleton, CI/CD, and testing infrastructure. 一句话让任何项目具备 AI 开发能力。",
    repo = "https://github.com/shuguang1994/project-blueprint",
    homepage = "https://github.com/shuguang1994/project-blueprint",
    licenses = {"MIT"},
    authors = {"shuguang1994"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "project-blueprint",

        versions = {
            ["1.7.0"] = { commit = "7495fc47b69b1ddf3331e305aff7ddb9f2a5d2f9" },
        },
        latest = "1.7.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
