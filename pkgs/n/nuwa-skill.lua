package = {
    spec = "1",

    name = "nuwa-skill",
    description = "你想蒸馏的下一个员工，何必是同事。蒸馏任何人的思维方式——心智模型、决策启发式、表达DNA。Distill how anyone thinks.",
    repo = "https://github.com/alchaincyf/nuwa-skill",
    homepage = "https://github.com/alchaincyf/nuwa-skill",
    licenses = {"MIT"},
    authors = {"alchaincyf"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "huashu-nuwa",

        versions = {
            ["1.1.0"] = { commit = "5bb9b659b7750e2ae775308bf2af706e37cbae30" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
