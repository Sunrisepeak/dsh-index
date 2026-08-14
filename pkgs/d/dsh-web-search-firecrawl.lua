package = {
    spec = "1",

    name = "dsh-web-search-firecrawl",
    description = "Firecrawl-backed search provider plugin for the DeepSeek Harness web capability seam (ctx.web)",
    repo = "https://github.com/yangzhe1003/dsh-web-search-firecrawl",
    homepage = "https://github.com/yangzhe1003/dsh-web-search-firecrawl",
    licenses = {"MIT"},
    authors = {"yangzhe1003"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@yangzhe1003/dsh-web-search-firecrawl",

        versions = {
            ["0.1.2"] = { commit = "0dbada94d853ded77095f061992a3e227e6ff6df" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
