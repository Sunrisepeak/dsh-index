package = {
    spec = "1",

    name = "marketingdashboard",
    description = "面向金融与产业研究的一屏式实时行情大屏：A股/港股/美股指数、大宗商品、美债收益率、板块热点、主力资金流、7×24 快讯、产业链自选股、AI 大模型 Token 追踪。A real-time market research cockpit on a single screen: CN/HK/US indices, commodities, treasury yields, sector hotspots, capital flows, 7×24 news, industry-chain watchlists and AI token usage trends.",
    repo = "https://github.com/theBigGavin/marketingdashboard",
    homepage = "https://github.com/theBigGavin/marketingdashboard",
    licenses = {"MIT"},
    authors = {"theBigGavin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "my-app",

        versions = {
            ["1.4.0"] = { commit = "5b8056e2aa56ced08a12fbc116712540af74f942" },
        },
        latest = "1.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
