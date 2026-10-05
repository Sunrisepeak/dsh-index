package = {
    spec = "1",

    name = "jevdo",
    description = "Just Jev it. A Jev-first agent loop with reusable actions for DeepSeek Harness.",
    repo = "https://github.com/yinhong-zhou/jevdo",
    homepage = "https://github.com/yinhong-zhou/jevdo",
    licenses = {"MIT"},
    authors = {"yinhong-zhou"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "jevaction",

        versions = {
            ["0.1.0"] = { commit = "360b662d9ba72a362cb3eb81ffa89b2709fa4d7c" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
