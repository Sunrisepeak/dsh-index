package = {
    spec = "1",

    name = "dsh-web-search-free",
    description = "面向 DeepSeek Harness 的免费 Web Search 插件，支持 Tavily、Exa、Brave 等九个引擎按可配置顺序自动 fallback",
    repo = "https://github.com/MochiNek0/dsh-web-search-free",
    homepage = "https://github.com/MochiNek0/dsh-web-search-free",
    licenses = {"MIT"},
    authors = {"MochiNek0"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-search-free",

        versions = {
            ["1.6.0"] = { commit = "88a40f5ac979ebd00c14e85c44a52eefb61d53e7" },
        },
        latest = "1.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
