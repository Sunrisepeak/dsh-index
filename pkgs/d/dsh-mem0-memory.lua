package = {
    spec = "1",

    name = "dsh-mem0-memory",
    description = "深度集成 Mem0、面向中文生态的 DSH 记忆插件：会话记忆自动入库 mem0 向量库并在新会话自动召回（插件 + 导入/搜索 CLI + 本地服务三件套）",
    repo = "https://github.com/kittitys/dsh-mem0-memory",
    homepage = "https://github.com/kittitys/dsh-mem0-memory",
    licenses = {"MIT"},
    authors = {"kittitys"},

    status = "dev",
    categories = {"dsh-plugin", "memory", "mem0", "agent", "chinese"},
    keywords = {"dsh", "mem0", "memory", "recall", "vector-store", "qdrant", "bm25", "chinese", "llm", "agent" },

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mem0-memory",

        versions = {
            ["0.1.1"] = { commit = "b68d2fd7a50a888c816f91db07ac8165ed375cea" },
        },
        latest = "0.1.1",

        needs_build = false,
    },
}
