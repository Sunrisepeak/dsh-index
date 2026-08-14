package = {
    spec = "1",

    name = "dsh-balance",
    description = "DeepSeek Harness balance plugin for the Settings page",
    repo = "https://github.com/crazywoola/dsh-balance",
    homepage = "https://github.com/crazywoola/dsh-balance",
    licenses = {"MIT"},
    authors = {"crazywoola"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@pinkbanana/dsh-balance",

        versions = {
            ["0.3.2"] = { commit = "269d81fa289153f71c0864af3d72e2572c9d7740" },
        },
        latest = "0.3.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
