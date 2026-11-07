package = {
    spec = "1",

    name = "dsh-skill-mcp-panel",
    description = "DSH Web UI plugin: skill and MCP management（Web界面的skill/MCP管理工具）",
    repo = "https://github.com/Fishquito7/dsh-skill-mcp-panel",
    homepage = "https://github.com/Fishquito7/dsh-skill-mcp-panel",
    licenses = {"MIT"},
    authors = {"Fishquito7"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skill-mcp-panel",

        versions = {
            ["2.0.1"] = { commit = "8e772005329de9dc81ffdfd00ae4dbed22a1f73a" },
        },
        latest = "2.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
