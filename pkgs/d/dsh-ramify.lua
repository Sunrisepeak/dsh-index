package = {
    spec = "1",

    name = "dsh-ramify",
    description = "Ramify 是 DeepSeek Harness 的创意分支画布插件，用树状工作区生成、对比和迭代多个可交互方案。",
    repo = "https://github.com/yanglongyun/dsh-ramify",
    homepage = "https://github.com/yanglongyun/dsh-ramify",
    licenses = {"MIT"},
    authors = {"yanglongyun"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@ramify/dsh-ramify",

        versions = {
            ["0.1.0"] = { commit = "771ac087312a8d78e3ae34d090c6a809724aa619" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
