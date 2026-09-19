package = {
    spec = "1",

    name = "dsh-video-lens",
    description = "dsh-video-lens",
    repo = "https://github.com/dundunhan/dsh-video-lens",
    homepage = "https://github.com/dundunhan/dsh-video-lens",
    licenses = {"MIT"},
    authors = {"dundunhan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-video-lens",

        versions = {
            ["0.3.1"] = { commit = "73c30b168c4b4562f1d9833c28ba12fa93284234" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
