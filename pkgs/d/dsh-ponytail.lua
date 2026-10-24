package = {
    spec = "1",

    name = "dsh-ponytail",
    description = "DeepSeek Harness plugin: DietrichGebert/ponytail lazy senior mode & 7-rung ladder port, 6 skills with bilingual descriptions & per-skill toggles, zero tools, zero-cache-miss | DeepSeek Harness 插件：DietrichGebert/ponytail 懒人 senior 模式与七阶梯子完美移植，6 个技能描述双语自由切换，各个技能自由开关，零 tool 注册，全场景零缓存破坏",
    repo = "https://github.com/Wenaixi/dsh-ponytail",
    homepage = "https://github.com/Wenaixi/dsh-ponytail",
    licenses = {"MIT"},
    authors = {"Wenaixi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@wenaixi/dsh-ponytail",

        versions = {
            ["5.6.1"] = { commit = "429f074018c61fcf6bc9d547a45cea8733a77898" },
        },
        latest = "5.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
