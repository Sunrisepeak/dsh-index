package = {
    spec = "1",

    name = "dsh-mcp-connector",
    description = "DeepSeek Harness MCP Connector and MCP Server marketplace with over one hundred MCP connectors. Discover, authorize, and manage connections; supports OAuth 2.0 PKCE, API keys, stdio/HTTP, mcpServers JSON import, and tool and prompt discovery. Maintained by Qichacha/QCC.",
    repo = "https://github.com/duhu2000/dsh-mcp-connector",
    homepage = "https://github.com/duhu2000/dsh-mcp-connector",
    licenses = {"MIT"},
    authors = {"duhu2000"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp-connector",

        versions = {
            ["0.2.32"] = { commit = "312becc78bb65809927e26e063ea255bd1aef2b3" },
        },
        latest = "0.2.32",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
