package = {
    spec = "1",

    name = "dsh-tinyfish-search",
    description = "TinyFish-backed web search provider for DeepSeek Harness (ctx.web) — 将内置 web_search 接入 TinyFish Search API 的 DeepSeek Harness 插件",
    repo = "https://github.com/maxwell-feng/dsh-tinyfish-search",
    homepage = "https://github.com/maxwell-feng/dsh-tinyfish-search",
    licenses = {"MIT"},
    authors = {"maxwell-feng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tinyfish-search",

        versions = {
            ["0.2.0"] = { commit = "779dc655cd0898757938049314d3057d5b9c9cd6" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
