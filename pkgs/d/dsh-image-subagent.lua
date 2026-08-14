package = {
    spec = "1",

    name = "dsh-image-subagent",
    description = "dsh-image-subagent",
    repo = "https://github.com/yuqingsh/dsh-image-subagent",
    homepage = "https://github.com/yuqingsh/dsh-image-subagent",
    licenses = {"MIT"},
    authors = {"yuqingsh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-image-subagent",

        versions = {
            ["0.1.1"] = { commit = "91e62b5147763b832a3ee178851f0692765e5d8b" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
