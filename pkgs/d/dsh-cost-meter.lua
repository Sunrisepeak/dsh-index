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
            ["1.7.1"] = { commit = "e10e7c37601c07d570070cda7ea72da48cad8bd6" },
            ["1.6.12"] = { commit = "b21e27ad1756cf0a20cc68f4d6e3ee5beec51f89" },
            ["1.6.9"] = { commit = "56455e17848d37208761bcc82964ab8e263a1167" },
            ["1.6.7"] = { commit = "268b89fd871ab19111845dd7b0b6f65f6e00cc54" },
            ["1.6.1"] = { commit = "c4e2ab734624277858538dc30a8b5ac543ef6ba5" },
            ["1.5.45"] = { commit = "ed93fb25f0a7fee92c4598164de35600cc183570" },
            ["1.5.42"] = { commit = "f905e081b0d25c4ee3e9fced560a887856f6129c" },
            ["1.5.40"] = { commit = "a6ab9d61936e89521e800d16ce9b4dc6723972f9" },
            ["1.5.36"] = { commit = "5924abd2e48d887bcb6573794904a5b7af83a941" },
            ["1.5.30"] = { commit = "17528fdc0f242fe803dc717370d214f525f04ce1" },
            ["1.5.26"] = { commit = "65ba237d76ef9fc69c890b2407035788f7d50c98" },
            ["1.5.18"] = { commit = "c9e842d6fef335eccd72af746a27ac6ed885bd4f" },
            ["1.5.4"] = { commit = "7b8e071084453fe42f37e16f77523e8051fe6f7f" },
            ["1.3.1"] = { commit = "7132fa065cb6994bf381d5482962248a08afc75a" },
            ["1.2.0"] = { commit = "2908d2dca74c2978a641d65544bdfff6b54d9eff" },
        },
        latest = "1.7.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
