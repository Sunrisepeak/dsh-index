package = {
    spec = "1",

    name = "dsh-lark-bot",
    description = "dsh-lark-bot：把 DeepSeek Harness (dsh) 桥接进飞书/Lark 的 bot，含完整项目工作区管理。A bridge bot connecting DeepSeek Harness (dsh) into Feishu/Lark with full workspace management. deepseek · deepseek harness · feishu · lark · bridge · bot",
    repo = "https://github.com/PlutoKeating/dsh-lark-bot",
    homepage = "https://github.com/PlutoKeating/dsh-lark-bot",
    licenses = {"AGPL-3.0"},
    authors = {"PlutoKeating"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "dsh-lark",

        bundle_name = "dsh-lark-bot",

        versions = {
            ["0.8.0"] = { commit = "b784e7c466b65412e4a2f384b7af00527fdfab23" },
        },
        latest = "0.8.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
