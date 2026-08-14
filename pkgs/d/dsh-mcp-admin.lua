package = {
    spec = "1",

    name = "dsh-mcp-admin",
    description = "View MCP server status (/mcp) and manage MCP servers per profile from the settings page.",
    repo = "https://github.com/kairoz9/dsh-mcp-admin",
    homepage = "https://github.com/kairoz9/dsh-mcp-admin",
    licenses = {"MIT"},
    authors = {"kairoz9"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp-admin",

        versions = {
            ["0.1.0"] = { commit = "d4172f0e6737242e3f6fbfff1a7424545fc6907e" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
