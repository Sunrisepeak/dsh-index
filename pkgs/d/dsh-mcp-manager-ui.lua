package = {
    spec = "1",

    name = "dsh-mcp-manager-ui",
    description = "MCP server management UI for DeepSeek Harness Web — floating panel, JSON import, and profile-backed persistence.",
    repo = "https://github.com/Imzl-zl/dsh-mcp-manager-ui",
    homepage = "https://github.com/Imzl-zl/dsh-mcp-manager-ui",
    licenses = {"MIT"},
    authors = {"Imzl-zl"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp-manager-ui",

        versions = {
            ["1.1.8"] = { commit = "a2a729f3606d4e3de2bc102f33428511fed4f40f" },
        },
        latest = "1.1.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
