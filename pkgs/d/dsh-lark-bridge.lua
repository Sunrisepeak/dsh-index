package = {
    spec = "1",

    name = "dsh-lark-bridge",
    description = "A native DeepSeek Harness (dsh) plugin bridging dsh coding agents to Feishu/Lark group chats — one group, one project directory.",
    repo = "https://github.com/bihangchi9-creator/dsh-lark-bridge",
    homepage = "https://github.com/bihangchi9-creator/dsh-lark-bridge",
    authors = {"bihangchi9-creator"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lark-bridge",

        versions = {
            ["0.0.1"] = { commit = "c09eb4cb81347472625db119af6109d05a6ab607" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
