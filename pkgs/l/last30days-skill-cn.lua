package = {
    spec = "1",

    name = "last30days-skill-cn",
    description = "给 AI Agent 的中文互联网研究 Skill：检索 8 大平台最近 30 天的讨论，追踪跨平台热点，生成附原始来源的报告，并提供每日全网热榜。支持 Claude Code、Codex、OpenClaw。",
    repo = "https://github.com/Jesseovo/last30days-skill-cn",
    homepage = "https://github.com/Jesseovo/last30days-skill-cn",
    authors = {"Jesseovo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "last30days-skill-cn",

        versions = {
            ["4.0.0"] = { commit = "e0e41410de18466aceb505faee5ef998cacee1e8" },
        },
        latest = "4.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
