package = {
    spec = "1",

    name = "dsh-mcp",
    description = "DeepSeek Harness 的 MCP 服务器管理插件：可视化界面管理 + 按需热注入，OAuth 鉴权支持，环境变量配置。",
    repo = "https://github.com/ArvinQi/dsh-mcp",
    homepage = "https://github.com/ArvinQi/dsh-mcp",
    licenses = {"MIT"},
    authors = {"ArvinQi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp",

        versions = {
            ["1.14.1"] = { commit = "af4df165b30cc9a954670a6990dd2edca017c975" },
        },
        latest = "1.14.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
