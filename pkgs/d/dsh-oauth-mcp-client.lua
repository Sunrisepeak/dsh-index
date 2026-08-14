package = {
    spec = "1",

    name = "dsh-oauth-mcp-client",
    description = "OAuth 2.1 Streamable HTTP MCP client plugin for DeepSeek Harness.",
    repo = "https://github.com/springbrand-lab/dsh-oauth-mcp-client",
    homepage = "https://github.com/springbrand-lab/dsh-oauth-mcp-client",
    licenses = {"MIT"},
    authors = {"springbrand-lab"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "@dsh-external/dsh-oauth-mcp-client",

        versions = {
            ["0.1.0"] = { commit = "796f415186c5f95326241008ea2181082fd205af" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
