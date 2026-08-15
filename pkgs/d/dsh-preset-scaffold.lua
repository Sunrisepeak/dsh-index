package = {
    spec = "1",

    name = "dsh-preset-scaffold",
    description = "Project scaffold agent plugin: strict 5-phase init runbook, engineering structure and config standards, and six runnable starter templates (node-ts, react-vite, python, go, spring-boot, monorepo). 项目初始化脚手架：严格五阶段流程 + 工程规范 + 六套可运行模板。",
    repo = "https://github.com/duyanta123/dsh-preset-scaffold",
    homepage = "https://github.com/duyanta123/dsh-preset-scaffold",
    licenses = {"MIT"},
    authors = {"duyanta123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-preset-scaffold",

        versions = {
            ["0.1.1"] = { commit = "e625043e40509ac018f1712709f8160bca906320" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}