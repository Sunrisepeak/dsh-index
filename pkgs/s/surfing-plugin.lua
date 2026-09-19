package = {
    spec = "1",

    name = "surfing-plugin",
    description = "SearXNG search and Crawl4AI fetch providers for DeepSeek Harness",
    repo = "https://github.com/cyijun/surfing-plugin",
    homepage = "https://github.com/cyijun/surfing-plugin",
    licenses = {"MIT"},
    authors = {"cyijun"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-surfing-plugin",

        versions = {
            ["0.1.0"] = { commit = "40041327e552157bafcc9bba866925b775c1469d" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
