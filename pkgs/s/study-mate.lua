package = {
    spec = "1",

    name = "study-mate",
    description = "你的AI学习搭档：定路线、讲知识、做项目，边学边做，学透一门科目",
    repo = "https://github.com/Miaotofu01/Study-Mate",
    homepage = "https://github.com/Miaotofu01/Study-Mate",
    licenses = {"MIT"},
    authors = {"Miaotofu01"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@yunmiao/studymate",

        versions = {
            ["0.2.0"] = { commit = "7bd1a3bc0ed9ae978c8e35b9ae267e5ede9199e3" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
