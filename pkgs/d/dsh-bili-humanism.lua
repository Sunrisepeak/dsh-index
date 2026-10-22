package = {
    spec = "1",

    name = "dsh-bili-humanism",
    description = "用多彩的人类世界，训练 DSH 的人格：默认积累信笺反思于专用 human-world.md；允许通过 DSH 与外部插件接驳。历史、收藏、点赞与投币独立默认关闭；本项目不提供评论接口。",
    repo = "https://github.com/InariNGT-Ofiicial/dsh-bili-humanism",
    homepage = "https://github.com/InariNGT-Ofiicial/dsh-bili-humanism",
    licenses = {"MIT"},
    authors = {"InariNGT-Ofiicial"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-bili-humanism",

        versions = {
            ["1.4.0"] = { commit = "21797972f607fd02c064bf82e48f8607f67135e7" },
        },
        latest = "1.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
