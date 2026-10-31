package = {
    spec = "1",

    name = "dsh-balance-monitor",
    description = "DeepSeek 账户余额、剩余比例条与今日花费，显示在 dsh 侧边栏底部 · DeepSeek balance, remaining-ratio bar and today's spend in the dsh sidebar footer.",
    repo = "https://github.com/jelly-000/dsh-balance-monitor",
    homepage = "https://github.com/jelly-000/dsh-balance-monitor",
    licenses = {"MIT"},
    authors = {"jelly-000"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-balance-monitor",

        versions = {
            ["0.1.2"] = { commit = "fb9eb8d981c05ee55e8d7934e4688c9bef023b21" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
