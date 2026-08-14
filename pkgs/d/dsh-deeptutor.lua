package = {
    spec = "1",

    name = "dsh-deeptutor",
    description = "Learning assistant extension for DeepSeek Harness (dsh): brings DeepTutor tutoring to your agent — deep explanations, self-test questions, learning paths, personal knowledge-base search (RAG), and note archiving. | 面向 DeepSeek Harness 的学习辅助扩展:为 agent 接入 DeepTutor 辅导能力 —— 深度讲解、自测题、学习路径规划、个人知识库检索(RAG)与笔记归档。",
    repo = "https://github.com/TecFancy/dsh-deeptutor",
    homepage = "https://github.com/TecFancy/dsh-deeptutor",
    authors = {"TecFancy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deeptutor",

        versions = {
            ["0.1.9"] = { commit = "0cb81a7c7e4153f9fec58f084ad2ba1e70dbc04c" },
        },
        latest = "0.1.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
