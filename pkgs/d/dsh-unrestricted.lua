package = {
    spec = "1",

    name = "dsh-unrestricted",
    description = "DeepSeek Harness 提示词破限插件：通过系统提示词解除模型回答限制，深度适配 Web 与桌面端多模式及工具调用",
    repo = "https://github.com/yexi-by/dsh-unrestricted",
    homepage = "https://github.com/yexi-by/dsh-unrestricted",
    licenses = {"MIT"},
    authors = {"yexi-by"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-unrestricted",

        versions = {
            ["0.2.6"] = { commit = "35e3e7d9bced275361a6a938d1899647a919c8a3" },
        },
        latest = "0.2.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
