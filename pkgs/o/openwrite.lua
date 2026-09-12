package = {
    spec = "1",

    name = "openwrite",
    description = "dsh-Openwrite：OpenWrite 的 DeepSeek Harness 小说创作插件，含统一创作 Agent、90 个小说工具、原生工作台与标准审稿 DAG",
    repo = "https://github.com/LiPu-jpg/Openwrite",
    homepage = "https://github.com/LiPu-jpg/Openwrite",
    licenses = {"Apache-2.0"},
    authors = {"LiPu-jpg"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-openwrite",

        versions = {
            ["0.2.2"] = { commit = "f1a6229c4e8011aa93893f88828a68ffd3a34a63" },
        },
        latest = "0.2.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
