package = {
    spec = "1",

    name = "dsh-grok-search",
    description = "为 DeepSeek Harness 接入可视化 Grok 主搜索与 Tavily、Exa、TinyFish、Firecrawl 自动回退，复用 grok-search-rs。",
    repo = "https://github.com/Lain-in-coding/dsh-grok-search",
    homepage = "https://github.com/Lain-in-coding/dsh-grok-search",
    licenses = {"MIT"},
    authors = {"Lain-in-coding"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-grok-search",

        versions = {
            ["0.2.1"] = { commit = "d0dc943b819d64596c8d14967a38422014fab917" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
