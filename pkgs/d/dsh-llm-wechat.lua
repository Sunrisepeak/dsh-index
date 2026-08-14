package = {
    spec = "1",

    name = "dsh-llm-wechat",
    description = "DeepSeek Harness 微信网关适配插件：复用 DeepSeekAdapter + 流式 think 标签转译",
    repo = "https://github.com/sulfide2085/dsh-llm-wechat",
    homepage = "https://github.com/sulfide2085/dsh-llm-wechat",
    authors = {"sulfide2085"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-llm-wechat",

        versions = {
            ["0.1.0-rc.6"] = { commit = "fbcb00c5c6c85d32140bf459fcd62e7d4b433e19" },
        },
        latest = "0.1.0-rc.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
