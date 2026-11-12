package = {
    spec = "1",

    name = "dsh-knit",
    description = "面向 DeepSeek Harness 的任务上下文检索：根据当前对话，从项目工作区找到最相关的上下文，组织为主要 / 辅助 / 相关内容，并通过 Knit 面板与 knit_docs 提供给人和 Agent。纯本地、确定性、零模型调用、零网络。  Task-aware workspace context retrieval for DeepSeek Harness. Knit finds the project context most relevant to the current task, organizes it into primary / supporting / related context, and exposes the same context to humans a",
    repo = "https://github.com/PolinniZhong/dsh-knit",
    homepage = "https://github.com/PolinniZhong/dsh-knit",
    licenses = {"MIT"},
    authors = {"PolinniZhong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-knit",

        versions = {
            ["0.15.0"] = { commit = "f94ff70d8a6ff4df5e955b3c4791a05b3e7d815c" },
        },
        latest = "0.15.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
