package = {
    spec = "1",

    name = "deepseekharness-mcp-manager",
    description = "DSH durable MCP server manager plugin — Settings UI + HTTP API + mcp_manager_* model tools, cross-platform installers",
    repo = "https://github.com/xxxyz/DeepSeekHarness-MCP-Manager",
    homepage = "https://github.com/xxxyz/DeepSeekHarness-MCP-Manager",
    licenses = {"MIT"},
    authors = {"xxxyz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xxxyz/dsh-mcp-manager",

        versions = {
            ["2.2.7"] = { commit = "b6783c30a307842a3afccc7b549811219d10050c" },
        },
        latest = "2.2.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
