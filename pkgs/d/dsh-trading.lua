package = {
    spec = "1",

    name = "dsh-trading",
    description = "Trading research workbench for DeepSeek Harness (dsh): typed market-data seam, deterministic indicators, interactive chart cards ｜ 交易研究工作台插件：数据接缝 · 确定性指标 · 交互式K线卡",
    repo = "https://github.com/maddogfinance/dsh-trading",
    homepage = "https://github.com/maddogfinance/dsh-trading",
    licenses = {"MIT"},
    authors = {"maddogfinance"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "trading",

        bundle_name = "dsh-trading",

        versions = {
            ["0.0.0"] = { commit = "14229dcf354b56eeadf42b640097e1905cced5b5" },
        },
        latest = "0.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
