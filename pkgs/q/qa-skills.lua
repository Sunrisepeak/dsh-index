package = {
    spec = "1",

    name = "qa-skills",
    description = "让 AI 像资深测试工程师一样工作：全生命周期 QA Agent Skills 框架——方法论 + 10 Skills + 可复现 Benchmark（Claude Code 等 Agent 可用）",
    repo = "https://github.com/fishzjp/qa-skills",
    homepage = "https://github.com/fishzjp/qa-skills",
    licenses = {"MIT"},
    authors = {"fishzjp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-qa-skills",

        versions = {
            ["0.7.0"] = { commit = "b79b518a42a14ef44ac6182e527e8a5efca0602a" },
        },
        latest = "0.7.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
