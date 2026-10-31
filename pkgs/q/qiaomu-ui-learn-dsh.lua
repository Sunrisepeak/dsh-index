package = {
    spec = "1",

    name = "qiaomu-ui-learn-dsh",
    description = "原版乔木 UI 学习的 DeepSeek Harness 迁移版：13561 设计参考、106 交互标本、审美测验与 Markdown 学习笔记",
    repo = "https://github.com/joeseesun/qiaomu-ui-learn-dsh",
    homepage = "https://github.com/joeseesun/qiaomu-ui-learn-dsh",
    licenses = {"MIT"},
    authors = {"joeseesun"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "YOUR_PROFILE",

        bundle_name = "qiaomu-ui-learn-dsh",

        versions = {
            ["0.1.2"] = { commit = "80ac9520f19bfdea79a906f5134d80a2bf68a099" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
