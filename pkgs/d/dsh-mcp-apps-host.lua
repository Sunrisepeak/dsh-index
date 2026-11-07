package = {
    spec = "1",

    name = "dsh-mcp-apps-host",
    description = "MCP Apps Host plugin for DeepSeek Harness: renders interactive HTML cards from MCP _meta.ui in sandboxed iframes, bridges postMessage to MCP tools/call and resources/read",
    repo = "https://github.com/oriliz/dsh-mcp-apps-host",
    homepage = "https://github.com/oriliz/dsh-mcp-apps-host",
    authors = {"oriliz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-mcp-apps-host",

        versions = {
            ["0.1.0-rc.2"] = { commit = "2612771f4fdca510adf5dbd256eb9e5d39be4dc3" },
        },
        latest = "0.1.0-rc.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
