package = {
    spec = "1",

    name = "deepspider",
    description = "AI 原生智能爬虫与 JavaScript 逆向工程平台，基于 DSH、Patchright/CDP 与独立语义运行时，从浏览器证据恢复参数生成逻辑并交付可验证 Solver。",
    repo = "https://github.com/ma-pony/deepspider",
    homepage = "https://github.com/ma-pony/deepspider",
    authors = {"ma-pony"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepspider",

        versions = {
            ["1.0.0"] = { commit = "c922ce6d1a28658aa82cb3bc131d6170384c54a5" },
        },
        latest = "1.0.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
