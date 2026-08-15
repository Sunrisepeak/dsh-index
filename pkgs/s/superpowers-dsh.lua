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
            ["0.1.0"] = { commit = "49e2d65db55b4d3ec065ad824efe9b09465c8a26" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
