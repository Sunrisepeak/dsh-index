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
            ["0.1.6"] = { commit = "3d5b842084c0d11eb9a1257c885faabb1587e43f" },
            ["0.1.5"] = { commit = "a977e8edd3eacc27a45f5b4e30fc9a9edd38055e" },
            ["0.1.4"] = { commit = "bf280b8ca67f5902bf80efea5430b26d6821d177" },
            ["0.1.3"] = { commit = "9b2173f4a8a197a9a8af6596b4a1231e7b3fab0e" },
            ["0.1.2"] = { commit = "5d5155c024e70d06ccb86a892d1650af6a5e7f4c" },
            ["0.1.1"] = { commit = "b68d2fd7a50a888c816f91db07ac8165ed375cea" },
            ["0.1.0"] = { commit = "9222c2951f9920ff7de13b7dd98d96db807ed6de" },
        },
        latest = "0.1.6",

        needs_build = false,
    },
}
