package = {
    spec = "1",

    name = "dsh-s1",
    description = "Native s1 tools for the DeepSeek Harness (DSH): s1_search, s1_news, s1_crawl, s1_sitemap, s1_trending + bundled s1 skill",
    repo = "https://github.com/superagents-lab/dsh-s1",
    homepage = "https://github.com/superagents-lab/dsh-s1",
    licenses = {"MIT"},
    authors = {"superagents-lab"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-s1",

        versions = {
            ["0.1.0"] = { commit = "dd6be06e083896e76861a4b3bae0b954ff4a64a8" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
