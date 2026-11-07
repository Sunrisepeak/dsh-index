package = {
    spec = "1",

    name = "dsh-superpower",
    description = "DeepSeek Harness plugin: 15 obra/superpowers engineering skills, bilingual descriptions, per-skill toggles | DeepSeek Harness 插件：15 个 obra/superpowers 工程纪律技能，技能描述中英双语自由切换，每一个技能本身自由开关",
    repo = "https://github.com/Wenaixi/dsh-superpower",
    homepage = "https://github.com/Wenaixi/dsh-superpower",
    licenses = {"MIT"},
    authors = {"Wenaixi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@wenaixi/dsh-superpower",

        versions = {
            ["7.7.2"] = { commit = "ed29f5d65985169fa6c5e2b93df86e257541b1f1" },
        },
        latest = "7.7.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
