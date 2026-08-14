package = {
    spec = "1",

    name = "deepseek-harness-wallet",
    description = "Balance monitoring, per-session spend & token tracking, low-balance alerts, and an official recharge shortcut for DeepSeek Harness. / 余额监控和充值插件",
    repo = "https://github.com/feibi-mochi/deepseek-harness-wallet",
    homepage = "https://github.com/feibi-mochi/deepseek-harness-wallet",
    licenses = {"MIT"},
    authors = {"feibi-mochi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-wallet",

        versions = {
            ["0.1.1"] = { commit = "60246817574607aba709dfee8da3112437491a1e" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
