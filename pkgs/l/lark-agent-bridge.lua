package = {
    spec = "1",

    name = "lark-agent-bridge",
    description = "A native DeepSeek Harness (dsh) plugin bridging dsh coding agents to Feishu/Lark group chats — one group, one project directory.",
    repo = "https://github.com/bihangchi9-creator/lark-agent-bridge",
    homepage = "https://github.com/bihangchi9-creator/lark-agent-bridge",
    authors = {"bihangchi9-creator"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@bihangchi9/lark-agent-bridge",

        versions = {
            ["0.0.3"] = { commit = "5f5468ddf7a283f6f2f2111d105006cb5cfee60b" },
        },
        latest = "0.0.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
