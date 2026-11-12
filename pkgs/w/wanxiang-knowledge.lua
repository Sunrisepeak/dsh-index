package = {
    spec = "1",

    name = "wanxiang-knowledge",
    description = "万象知识库：DeepSeek Harness 本地知识库插件，支持一键会话存入知识库，让你的deepseek与你一起无限进步！  好用的话求个星星！",
    repo = "https://github.com/Minglink/wanxiang-knowledge",
    homepage = "https://github.com/Minglink/wanxiang-knowledge",
    licenses = {"MIT"},
    authors = {"Minglink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-wanxiang-knowledge",

        versions = {
            ["0.2.0-alpha.10"] = { commit = "cf369a915e40115887ae15852d539f5aaaa4ec7f" },
        },
        latest = "0.2.0-alpha.10",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
