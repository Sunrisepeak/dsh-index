package = {
    spec = "1",

    name = "dsh-a2a",
    description = "Agent2Agent mesh for the Harness",
    repo = "https://github.com/dpskh/dsh-a2a",
    homepage = "https://github.com/dpskh/dsh-a2a",
    authors = {"dpskh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dpskh/a2a",

        versions = {
            ["0.3.0"] = { commit = "aabf635d230fe856d640e02d6ac42267457c598e" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
