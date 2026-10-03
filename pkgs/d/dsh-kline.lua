package = {
    spec = "1",

    name = "dsh-kline",
    description = "面向 DeepSeek Harness 的交互式 K 线分析插件，支持多市场行情、技术指标、支撑压力位、新闻与基本面分析，并在原生侧栏中直接展示。",
    repo = "https://github.com/FTShare-Lab/dsh_kline",
    homepage = "https://github.com/FTShare-Lab/dsh_kline",
    licenses = {"MIT"},
    authors = {"FTShare-Lab"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@ftshare-lab/dsh-kline",

        versions = {
            ["0.1.2"] = { commit = "fc9ac6bd0893eb70e81772f5b3eb14708d7f5a95" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
