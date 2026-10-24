package = {
    spec = "1",

    name = "dsh-web-search-pro",
    description = "Enhanced, persistent web search plugin for DeepSeek Harness (multi-engine search, SQLite+LRU cache, platform backends, Playwright rendering)",
    repo = "https://github.com/anweat/dsh-web-search-pro",
    homepage = "https://github.com/anweat/dsh-web-search-pro",
    licenses = {"MIT"},
    authors = {"anweat"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-search-pro",

        versions = {
            ["0.1.2"] = { commit = "f8f388c75d11a5fbee673a4ab010c166098a989b" },
        },
        latest = "0.1.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
