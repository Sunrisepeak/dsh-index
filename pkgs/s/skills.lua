package = {
    spec = "1",

    name = "skills",
    description = "Collection of skills for Upstash",
    repo = "https://github.com/upstash/skills",
    homepage = "https://github.com/upstash/skills",
    licenses = {"MIT"},
    authors = {"upstash"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "upstash-skills",

        versions = {
            ["0.0.0"] = { commit = "fca2f1cf789b4a2e38bf5063f862587db0d40206" },
        },
        latest = "0.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
