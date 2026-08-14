package = {
    spec = "1",

    name = "dsh-harness-mcp-server",
    description = "Expose DeepSeek Harness agent capabilities as an MCP server (brain=Hermes, arms=Harness)",
    repo = "https://github.com/chushixixin/dsh-harness-mcp-server",
    homepage = "https://github.com/chushixixin/dsh-harness-mcp-server",
    licenses = {"MIT"},
    authors = {"chushixixin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@chushixixin/dsh-harness-mcp-server",

        versions = {
            ["0.1.5"] = { commit = "4c6b464f58c417a62f28fc7e12c42dae6f7ef129" },
        },
        latest = "0.1.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
