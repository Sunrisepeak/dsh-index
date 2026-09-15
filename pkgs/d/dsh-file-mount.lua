package = {
    spec = "1",

    name = "dsh-file-mount",
    description = "dsh-file-mount",
    repo = "https://github.com/acefun29/dsh-file-mount",
    homepage = "https://github.com/acefun29/dsh-file-mount",
    licenses = {"MIT"},
    authors = {"acefun29"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-file-mount",

        versions = {
            ["0.5.1"] = { commit = "27ac71d7a5d834e01198596ce1dcdfbe79d41ebe" },
        },
        latest = "0.5.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
