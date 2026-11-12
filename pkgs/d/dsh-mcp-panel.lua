package = {
    spec = "1",

    name = "dsh-mcp-panel",
    description = "MCP management console for the official DeepSeek Harness MCP client: /mcp command with health diagnostics and pipeline trial calls, a Settings MCP tab with server CRUD (approval-gated writes, automatic backups) and a tool trial console over the official tool pipeline (Apache-2.0, dsh-plugin).",
    repo = "https://github.com/PerryLink/dsh-mcp-panel",
    homepage = "https://github.com/PerryLink/dsh-mcp-panel",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp-panel",

        versions = {
            ["0.4.0"] = { commit = "a9b25772d51368bf94152f4863b40b0f444e1a70" },
        },
        latest = "0.4.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
