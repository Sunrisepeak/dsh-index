package = {
    spec = "1",

    name = "dsh-purge",
    description = "DeepSeek Harness 破甲：让所有模型都能破甲，不同模型可换不同提示词；默认提示词面向国模「小码酱」。Jailbreak for every model — swap prompts per model. 求 Star 收藏 ⭐",
    repo = "https://github.com/YuJunZhiXue/dsh-purge",
    homepage = "https://github.com/YuJunZhiXue/dsh-purge",
    licenses = {"MIT"},
    authors = {"YuJunZhiXue"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "default",

        bundle_name = "dsh-purge",

        versions = {
            ["1.3.0"] = { commit = "0422d458c21724f1639216080d9e2c81e9f0626f" },
        },
        latest = "1.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
