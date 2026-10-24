package = {
    spec = "1",

    name = "dsh-mcp-studio",
    description = "DeepSeek Harness 的 MCP 服务与 Skills 管理器：面板里增删改 MCP 行、扫描导入其他 Agent 配置、管理 Skills（DSH Web 插件）",
    repo = "https://github.com/functy23/dsh-mcp-studio",
    homepage = "https://github.com/functy23/dsh-mcp-studio",
    licenses = {"MIT"},
    authors = {"functy23"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-mcp-studio",

        versions = {
            ["1.0.6"] = { commit = "6b4f5dd2c0de5f20d4625940060f714054bddbe3" },
        },
        latest = "1.0.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
