package = {
    spec = "1",

    name = "dsh-web-tools",
    description = "Multi-provider Web Search & Fetch for DeepSeek Harness — Tavily, Exa, Firecrawl, Brave, You.com, Jina & SearXNG with fallback and native settings UI.",
    repo = "https://github.com/A3Boy/dsh-web-tools",
    homepage = "https://github.com/A3Boy/dsh-web-tools",
    licenses = {"MIT"},
    authors = {"A3Boy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-tools",

        versions = {
            ["0.1.0"] = { commit = "f089093d98039edc94c30bb09388266ea09e58e1" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
