package = {
    spec = "1",

    name = "dsh-rss",
    description = "DeepSeek Harness RSS 订阅插件：rss_list/add/remove/fetch/check 五工具，RSS 0.9x/1.0/2.0 与 Atom 归一化解析，订阅列表持久化到 settings，proxyUrl 特殊代理支持；纯 Node 全平台。· RSS/Atom subscription tools for DeepSeek Harness agents.",
    repo = "https://github.com/STARDUSTLC666/dsh-rss",
    homepage = "https://github.com/STARDUSTLC666/dsh-rss",
    licenses = {"MIT"},
    authors = {"STARDUSTLC666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-rss",

        versions = {
            ["0.1.0"] = { commit = "8092100d1ca1e58c8e58dabc34332e8944d20367" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
