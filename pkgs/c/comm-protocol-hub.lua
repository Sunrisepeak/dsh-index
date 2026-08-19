package = {
    spec = "1",

    name = "comm-protocol-hub",
    description = "将分散在 3GPP Release 15~18 的 70+ 条通信协议规范，按 TN/NTN/全息/近远场/混合/安全等 8 个维度结构化整理，为通信工程师和 AI 助手提供一键式协议查询能力。通过三个 DSH 工具（关键词搜索、分类浏览、单条详情），取代人工翻阅数百页 PDF 的繁琐过程，让大模型在通信领域回答更准确、有据可查。本项目填补了通信工程专业知识在 AI 助手中的空白，是首个面向通信领域的 DSH 协议知识库插件。",
    repo = "https://github.com/Thanksgiver233/comm-protocol-hub",
    homepage = "https://github.com/Thanksgiver233/comm-protocol-hub",
    licenses = {"MIT"},
    authors = {"Thanksgiver233"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-comm-protocol-hub",

        versions = {
            ["1.0.0"] = { commit = "8b7b07d88315ffe85ead1d680e72f9b83f07853d" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
