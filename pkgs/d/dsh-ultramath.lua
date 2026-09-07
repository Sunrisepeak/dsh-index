package = {
    spec = "1",

    name = "dsh-ultramath",
    description = "UltraMath 数学建模竞赛多 Agent 求解 DSH 插件: 5 角色预设 + 33 篇模型库 + 论文模板/审稿脚本随包 + 进度可视化",
    repo = "https://github.com/Andiii208/dsh-ultramath",
    homepage = "https://github.com/Andiii208/dsh-ultramath",
    licenses = {"MIT"},
    authors = {"Andiii208"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ultramath",

        versions = {
            ["0.6.3"] = { commit = "37d95b1820bb77e97a3efc8fe3cbbeb2e5c7a0d1" },
        },
        latest = "0.6.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
