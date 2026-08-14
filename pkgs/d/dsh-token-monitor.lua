package = {
    spec = "1",

    name = "dsh-token-monitor",
    description = "DeepSeek Harness plugin: token usage & conversation stats as a native settings page - today / 7d / 30d totals, GitHub-style 90-day contribution graph, session-log backfill | DeepSeek Harness 插件：Token 用量与对话统计设置页",
    repo = "https://github.com/zhangzheng25/dsh-token-monitor",
    homepage = "https://github.com/zhangzheng25/dsh-token-monitor",
    licenses = {"MIT"},
    authors = {"zhangzheng25"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-token-monitor",

        versions = {
            ["0.2.0"] = { commit = "6842c00fc514d6c0fc3ca51809a28d1b53a28c48" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
