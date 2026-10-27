package = {
    spec = "1",

    name = "superpowers-dsh",
    description = "Superpowers skills for DeepSeek Harness: TDD, debugging, planning, and collaboration skills adapted from obra/superpowers",
    repo = "https://github.com/LayneChai/superpowers-dsh",
    homepage = "https://github.com/LayneChai/superpowers-dsh",
    authors = {"LayneChai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "superpowers-dsh",

        versions = {
            ["0.4.0"] = { commit = "cc0c87f3a7a8627b175465f36a99e971e7eed507" },
            ["0.3.0"] = { commit = "426e7c4e727084374616ebd942a7e69567036d3a" },
            ["0.2.0"] = { commit = "10448b549702c0be9445beb454f39f6214a63601" },
            ["0.1.0"] = { commit = "49e2d65db55b4d3ec065ad824efe9b09465c8a26" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
