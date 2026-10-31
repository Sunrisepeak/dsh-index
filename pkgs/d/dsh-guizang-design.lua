package = {
    spec = "1",

    name = "dsh-guizang-design",
    description = "歸藏设计 · DeepSeek Harness 插件：网页 PPT、图文卡片、网页排版、去 AI 味四个 skill，一套设计系统；作品库、内容生产工作流、语气档案",
    repo = "https://github.com/op7418/dsh-guizang-design",
    homepage = "https://github.com/op7418/dsh-guizang-design",
    licenses = {"AGPL-3.0"},
    authors = {"op7418"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-guizang-design",

        versions = {
            ["0.1.3"] = { commit = "d16cea63497e1c6a95a63804b5274f93939ddb1d" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
