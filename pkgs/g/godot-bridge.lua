package = {
    spec = "1",

    name = "godot-bridge",
    description = "DSH (DeepSeek Harness) plugin that launches and drives a running Godot 4.x game through its in-game TCP interaction server — replaces the godot-mcp MCP server with native agent tools.",
    repo = "https://github.com/Smalldy/godot-bridge",
    homepage = "https://github.com/Smalldy/godot-bridge",
    licenses = {"MIT"},
    authors = {"Smalldy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "godot-bridge",

        versions = {
            ["0.1.2"] = { commit = "793fa73115efad8212b05ec933dbd968fa785f22" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
