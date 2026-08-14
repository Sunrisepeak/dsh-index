package = {
    spec = "1",

    name = "dsh-mcp-lens",
    description = "Shrink MCP context in DeepSeek Harness: 1,000 remote tools behind 2 exact-schema interfaces, with a measured V4 Flash cost pilot.",
    repo = "https://github.com/labmimors/dsh-mcp-lens",
    homepage = "https://github.com/labmimors/dsh-mcp-lens",
    licenses = {"MIT"},
    authors = {"labmimors"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mcp-lens",

        versions = {
            ["0.1.0-rc.6"] = { commit = "51cd0ec8d953576507a404cb06034842914b5b5c" },
        },
        latest = "0.1.0-rc.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
