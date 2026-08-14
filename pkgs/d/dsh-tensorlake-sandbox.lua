package = {
    spec = "1",

    name = "dsh-tensorlake-sandbox",
    description = "A deepseek harness plugin for tensorlake sandbox",
    repo = "https://github.com/tensorlakeai/dsh-tensorlake-sandbox",
    homepage = "https://github.com/tensorlakeai/dsh-tensorlake-sandbox",
    licenses = {"MIT"},
    authors = {"tensorlakeai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "@tensorlakeai/dsh-sandbox",

        versions = {
            ["0.1.0"] = { commit = "5d90a33888641c5fcedb6a78878eb43ee5d0c38d" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
