package = {
    spec = "1",

    name = "dsh-web-studyhub",
    description = "StudyHub: a DeepSeek Harness (DSH) plugin that turns your own material into questions and spaced review · 把自己的资料变成题目与间隔复习的 DSH 学习插件",
    repo = "https://github.com/EricWang1358/dsh-web-studyhub",
    homepage = "https://github.com/EricWang1358/dsh-web-studyhub",
    licenses = {"MIT"},
    authors = {"EricWang1358"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@ericwang1358/dsh-daily-flashcard",

        versions = {
            ["2.7.1"] = { commit = "dc719ab7863f030f100fee5142d7224bebb820ad" },
        },
        latest = "2.7.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
