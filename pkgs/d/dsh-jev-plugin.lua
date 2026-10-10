package = {
    spec = "1",

    name = "dsh-jev-plugin",
    description = "Native DeepSeek Harness (DSH) plugin integrating TypeSafe Jev as a System One decision layer for agent selection, supervision, corrections, and approvals.",
    repo = "https://github.com/luobosibing2/dsh-jev-plugin",
    homepage = "https://github.com/luobosibing2/dsh-jev-plugin",
    licenses = {"MIT"},
    authors = {"luobosibing2"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "jev",

        bundle_name = "@dsh-jev/plugin",

        versions = {
            ["0.1.0"] = { commit = "cd041b90a3a291d832d75030ea92975501280f63" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
