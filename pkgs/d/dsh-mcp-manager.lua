package = {
    spec = "1",

    name = "dsh-mcp-manager",
    description = "MCP server manager plugin for DeepSeek Harness: Settings → MCP page, OAuth (PKCE + dynamic client registration) or static-token auth, tools registered as mcp__<name>__*",
    repo = "https://github.com/hyqhyq3/dsh-mcp-manager",
    homepage = "https://github.com/hyqhyq3/dsh-mcp-manager",
    licenses = {"MIT"},
    authors = {"hyqhyq3"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp-manager",

        versions = {
            ["0.3.0"] = { commit = "88ac3def0e5a76f19e27bdf7effc099a7d33bb3e" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
