package = {
    spec = "1",

    name = "deepseek-harness-plugin-mcp",
    description = "MCP server that lets any agent discover, install, and run DeepSeek Harness plugins (topic: dsh-plugin).",
    repo = "https://github.com/bobleer/deepseek-harness-plugin-mcp",
    homepage = "https://github.com/bobleer/deepseek-harness-plugin-mcp",
    licenses = {"MIT"},
    authors = {"bobleer"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-plugin-mcp",

        versions = {
            ["0.1.0"] = { commit = "8b292eb2e423efcbc8ed173015cfd0daafc482ca" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
