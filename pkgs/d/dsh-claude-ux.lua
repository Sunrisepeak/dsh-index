package = {
    spec = "1",

    name = "dsh-claude-ux",
    description = "DSH plugin: Claude-style Chinese risk control & conversation autonomy for DeepSeek Harness web",
    repo = "https://github.com/eri64/dsh-claude-ux",
    homepage = "https://github.com/eri64/dsh-claude-ux",
    licenses = {"MIT"},
    authors = {"eri64"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-claude-ux",

        versions = {
            ["1.0.0"] = { commit = "5cb3d4973ca627288df2ae2e99a87ede5c6759d5" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
