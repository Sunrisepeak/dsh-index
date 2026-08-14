package = {
    spec = "1",

    name = "dsh-mcp-panel",
    description = "Read-only runtime management panel for the official DeepSeek Harness MCP client: /mcp command + Settings MCP tab with status, tools, errors, reconnect counts, sanitized display and controlled patch suggestions (Apache-2.0, dsh-plugin).",
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
            ["0.2.1"] = { commit = "b32ab8c83ebdad49ea173205d254e8f1a13d8abd" },
        },
        latest = "0.2.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
