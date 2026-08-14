package = {
    spec = "1",

    name = "sage-mem",
    description = "sage-mem",
    repo = "https://github.com/gezi-wen/sage-mem",
    homepage = "https://github.com/gezi-wen/sage-mem",
    licenses = {"Apache-2.0"},
    authors = {"gezi-wen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "sage-mem",

        versions = {
            ["0.1.3"] = { commit = "51ca522982e44e2d4d01a5dfddc76c3a879ed3b9" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
