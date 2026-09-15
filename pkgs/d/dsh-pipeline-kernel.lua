package = {
    spec = "1",

    name = "dsh-pipeline-kernel",
    description = "dsh-pipeline-kernel",
    repo = "https://github.com/not-big-dog/DSH-pipeline-kernel",
    homepage = "https://github.com/not-big-dog/DSH-pipeline-kernel",
    licenses = {"MIT"},
    authors = {"not-big-dog"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-pipeline-kernel",

        versions = {
            ["0.8.0"] = { commit = "ad0e0ace0c8cf1716a2e131f29d471d22c81633c" },
        },
        latest = "0.8.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
