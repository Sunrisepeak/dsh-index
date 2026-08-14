package = {
    spec = "1",

    name = "dsh-skills-manager",
    description = "DSH Skills 管理器：设置页系统/用户技能分类，用户技能开关/编辑/删除/新建。Skills manager for DeepSeek Harness: system/user skill management (toggle/edit/delete/create) in Settings.",
    repo = "https://github.com/xiaoxianyu-office/dsh-skills-manager",
    homepage = "https://github.com/xiaoxianyu-office/dsh-skills-manager",
    authors = {"xiaoxianyu-office"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skills-manager",

        versions = {
            ["0.1.2"] = { commit = "3b93ba2a58b74a3ad48041f28ae7b1e165ac3f6c" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
