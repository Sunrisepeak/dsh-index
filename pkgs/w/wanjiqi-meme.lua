package = {
    spec = "1",

    name = "wanjiqi-meme",
    description = "玩机器(6657直播间)烂梗 Skill：22771条真实弹幕烂梗蒸馏成AI Skill，生成玩机器式弹幕/解说吐槽/CS×DOTA双料梗",
    repo = "https://github.com/Chu-Xin-r/wanjiqi-meme",
    homepage = "https://github.com/Chu-Xin-r/wanjiqi-meme",
    licenses = {"MIT"},
    authors = {"Chu-Xin-r"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "wanjiqi-meme",

        versions = {
            ["0.1.0"] = { commit = "de4eac5ba5275ba08012fa71619298b19e9dcae6" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
