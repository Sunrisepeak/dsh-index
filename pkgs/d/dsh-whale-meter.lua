package = {
    spec = "1",

    name = "dsh-whale-meter",
    description = "🐳 鲸鱼电表：你在 DeepSeek Harness 上烧了多少 token？消耗量段位、可晒的战绩卡、6 家厂商 46 个模型精准计价（含国内分档）、8·17 调价前后对比。零配置，数据全在本机 | Token usage tiers & cost dashboard for DSH",
    repo = "https://github.com/Shiye-10Pages/dsh-whale-meter",
    homepage = "https://github.com/Shiye-10Pages/dsh-whale-meter",
    licenses = {"MIT"},
    authors = {"Shiye-10Pages"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-meter",

        versions = {
            ["0.1.0"] = { commit = "c484500e6a00d26317dc71ee854ced26df6f2aaa" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
