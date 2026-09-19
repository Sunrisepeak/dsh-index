package = {
    spec = "1",

    name = "dsh-search-mcp",
    description = "Replace dsh's built-in web search with search MCP servers (Tavily/Brave/Exa/Perplexity/DuckDuckGo/custom), configured from the web Settings page. Disables the built-in DeepSeek search provider while enabled.",
    repo = "https://github.com/gxpppp/dsh-search-mcp",
    homepage = "https://github.com/gxpppp/dsh-search-mcp",
    licenses = {"MIT"},
    authors = {"gxpppp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-search-mcp",

        versions = {
            ["0.1.0"] = { commit = "9562b966d2fe058676fe3163533d003c6913d7cc" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
