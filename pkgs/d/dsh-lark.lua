package = {
    spec = "1",

    name = "dsh-lark",
    description = "Lark/Feishu IM bot channel for DeepSeek Harness | 飞书 DeepSeek Harness 插件",
    repo = "https://github.com/omdsh-dev/dsh-lark",
    homepage = "https://github.com/omdsh-dev/dsh-lark",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lark-channel",

        versions = {
            ["0.0.7"] = { commit = "632807d9abafbb866a5e208a0298eff21c7856d1" },
            ["0.0.6"] = { commit = "56932fa133fe8d8b9df227aa7a4dd8913a6f50d9" },
            ["0.0.4"] = { commit = "a2736bb7c3e566d26548a13bbeeb6095ade605e5" },
        },
        latest = "0.0.7",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
