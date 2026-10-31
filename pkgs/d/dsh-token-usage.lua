package = {
    spec = "1",

    name = "dsh-token-usage",
    description = "Persistent token usage records and dashboard for DeepSeek Harness",
    repo = "https://github.com/LeemanCheung/dsh-token-usage",
    homepage = "https://github.com/LeemanCheung/dsh-token-usage",
    licenses = {"MIT"},
    authors = {"LeemanCheung"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-token-usage",

        versions = {
            ["0.1.0"] = { commit = "462679bd51d5776bfced4921a1c584e0e89b2273" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
