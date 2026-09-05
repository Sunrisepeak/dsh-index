package = {
    spec = "1",

    name = "dsh-mcp-manage",
    description = "DSH（DeepSeek Harness）Web GUI 插件：在设置页管理 MCP 服务器——列出已安装工具，添加/编辑/删除、启用/停用；组合配置提供的 MCP 同样可在运行时直接编辑、停用、移除并恢复，无需重启宿主。",
    repo = "https://github.com/null119/dsh-mcp-manage",
    homepage = "https://github.com/null119/dsh-mcp-manage",
    licenses = {"MIT"},
    authors = {"null119"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp-manage",

        versions = {
            ["0.2.0"] = { commit = "2a2a2a9a3f29b0526eb46de12751ea6a22548bf1" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
