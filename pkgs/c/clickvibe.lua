package = {
    spec = "1",

    name = "clickvibe",
    description = "clickvibe",
    repo = "https://github.com/ai-daming/clickvibe",
    homepage = "https://github.com/ai-daming/clickvibe",
    authors = {"ai-daming"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "clickvibe",

        versions = {
            ["0.1.0"] = { commit = "94b728946163e02b09ffec6b885a638e35a9b81e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
