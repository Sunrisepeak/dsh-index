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
            ["0.1.4"] = { commit = "801ff2d33c2b6a0b40f1277c8296ce58f1abcd3c" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
