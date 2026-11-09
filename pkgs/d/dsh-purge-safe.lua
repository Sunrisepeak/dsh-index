package = {
    spec = "1",

    name = "dsh-purge-safe",
    description = "DeepSeek Harness 破甲：默认提示词面向国模「鸢码」，完整开放版，无付费墙，技能库与知识库全含。破解市面上收费 388u 的版本，免费公开。Jailbreak for every model — swap prompts per model. 求 Star 收藏 ⭐",
    repo = "https://github.com/CallMeGuLab/dsh-purge-safe",
    homepage = "https://github.com/CallMeGuLab/dsh-purge-safe",
    licenses = {"Apache-2.0"},
    authors = {"CallMeGuLab"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-purge-safe",

        versions = {
            ["0.1.0"] = { commit = "d27941ba13e361f7429398cefe937c5ceee125fc" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
