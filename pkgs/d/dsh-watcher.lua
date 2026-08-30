package = {
    spec = "1",

    name = "dsh-watcher",
    description = "Read-only Agent work-path observer for DeepSeek Harness",
    repo = "https://github.com/aa2246740/dsh-watcher",
    homepage = "https://github.com/aa2246740/dsh-watcher",
    licenses = {"MIT"},
    authors = {"aa2246740"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-watcher",

        versions = {
            ["0.3.0"] = { commit = "cdeb4989d2385a9de71755bd2d0e70f52cc39e7c" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
