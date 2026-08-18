package = {
    spec = "1",

    name = "dsh-cost-meter",
    description = "DeepSeek Harness 会话费用统计插件:本会话费用、当日费用、历史记录与官方价格同步",
    repo = "https://github.com/Han-1413141/dsh-cost-meter",
    homepage = "https://github.com/Han-1413141/dsh-cost-meter",
    licenses = {"MIT"},
    authors = {"Han-1413141"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-cost-meter",

        versions = {
            ["1.5.4"] = { commit = "7b8e071084453fe42f37e16f77523e8051fe6f7f" },
            ["1.3.1"] = { commit = "7132fa065cb6994bf381d5482962248a08afc75a" },
            ["1.2.0"] = { commit = "2908d2dca74c2978a641d65544bdfff6b54d9eff" },
        },
        latest = "1.5.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
