package = {
    spec = "1",

    name = "dsh-project-brain",
    description = "Persistent project intelligence and memory plugin for DSH: architecture analysis, cross-session context, TODOs, and optional hybrid retrieval",
    repo = "https://github.com/yj-liuzepeng/dsh-project-brain",
    homepage = "https://github.com/yj-liuzepeng/dsh-project-brain",
    licenses = {"MIT"},
    authors = {"yj-liuzepeng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-project-brain",

        versions = {
            ["1.3.1"] = { commit = "19acb88f20c3451bc9f9630def478363eebc2de4" },
        },
        latest = "1.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
