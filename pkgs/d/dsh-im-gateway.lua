package = {
    spec = "1",

    name = "dsh-im-gateway",
    description = "把 dsh agent 接入微信、飞书等 20+ 聊天平台的聚合网关插件 | Aggregate IM gateway for DeepSeek Harness (dsh): connect your agents to WeChat, Feishu, Telegram, Discord & 20+ chat platforms",
    repo = "https://github.com/zhuiyueya/dsh-im-gateway",
    homepage = "https://github.com/zhuiyueya/dsh-im-gateway",
    licenses = {"MIT"},
    authors = {"zhuiyueya"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-im-gateway",

        versions = {
            ["0.1.0"] = { commit = "cb141ba2f9cb71a06a751291fc680101e5fb6ddb" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
