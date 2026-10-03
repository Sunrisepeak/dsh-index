package = {
    spec = "1",

    name = "dsh-theme-plugin",
    description = "Chinese traditional colors as a DeepSeek Harness theme pack.",
    repo = "https://github.com/nevertoday/dsh-theme-plugin",
    homepage = "https://github.com/nevertoday/dsh-theme-plugin",
    licenses = {"MIT"},
    authors = {"nevertoday"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-theme-plugin",

        versions = {
            ["0.3.3"] = { commit = "b85a37bc252ad423b2d3aee45fa4e2a72e15ca94" },
        },
        latest = "0.3.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
