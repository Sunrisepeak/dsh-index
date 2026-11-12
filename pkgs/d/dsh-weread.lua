package = {
    spec = "1",

    name = "dsh-weread",
    description = "微信读书 dsh 插件：书架管理、年度书墙、阅读统计、AI 总结 | DeepSeek Harness plugin for WeChat Reading",
    repo = "https://github.com/zhaohongxuan/dsh-weread",
    homepage = "https://github.com/zhaohongxuan/dsh-weread",
    licenses = {"MIT"},
    authors = {"zhaohongxuan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-weread",

        versions = {
            ["0.3.0"] = { commit = "80fa890d43bb4810b61d1e1d55c3bc5279986a54" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
