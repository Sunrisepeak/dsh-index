package = {
    spec = "1",

    name = "dsh-plannotator",
    description = "DSH 计划批注插件：选中计划原文、逐条批注，并把结构化反馈送回 Agent。 / A DSH plan-review plugin for anchored annotations and structured Age",
    repo = "https://github.com/titanwings/dsh-plannotator",
    homepage = "https://github.com/titanwings/dsh-plannotator",
    licenses = {"MIT"},
    authors = {"titanwings"},

    status = "dev",
    categories = {"dsh-plugin", "workflow"},
    keywords = {"dsh", "plan-review", "plannotator"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-plannotator",

        versions = {
            ["0.1.4"] = { commit = "053c982f96b77fd750360ee66384bf90d5c1e603" },
            ["0.1.3"] = { commit = "c0fe880107aa09ef595a8b6fdac6d7099e4b46da" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.3"] = {
                tarball = "dsh-plannotator-0.1.3.tgz",
                sha256  = "828ac6f03ae5b5afc2b7d597c5164e11fb6fdfcf3c926a90f62bdf287e00d75c",
                cn      = true,
            },
        },
    },
}
