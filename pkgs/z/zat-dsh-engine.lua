package = {
    spec = "1",

    name = "zat-dsh-engine",
    description = "Visual plugin marketplace for DeepSeek Harness — browse, search and install community plugins",
    repo = "https://github.com/mishibeikejie/zat-dsh-engine",
    homepage = "https://github.com/mishibeikejie/zat-dsh-engine",
    licenses = {"MIT"},
    authors = {"mishibeikejie"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "zat-dsh-engine",

        versions = {
            ["0.3.1"] = { commit = "cd7990fcd4491bcaf6b02b6a17fbe70fbbf50014" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
