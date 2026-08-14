package = {
    spec = "1",

    name = "dsh-file-review",
    description = "a dsh plugin - review  files that an agent just changed,you can see the diff",
    repo = "https://github.com/left0ver/dsh-file-review",
    homepage = "https://github.com/left0ver/dsh-file-review",
    licenses = {"MIT"},
    authors = {"left0ver"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-file-review",

        versions = {
            ["0.2.1"] = { commit = "f5650428fa2cb4dc5496bcb63455c6c75dfbc49b" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
