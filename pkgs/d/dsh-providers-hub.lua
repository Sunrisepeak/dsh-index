package = {
    spec = "1",

    name = "dsh-providers-hub",
    description = "deepseek-harness plugin: sign in and manage accounts across multiple AI coding providers, with multi-account pools and silent credential refresh",
    repo = "https://github.com/iJetLi/dsh-providers-hub",
    homepage = "https://github.com/iJetLi/dsh-providers-hub",
    licenses = {"MIT"},
    authors = {"iJetLi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-providers-hub",

        versions = {
            ["0.2.1-rc.2"] = { commit = "e3798509becfb1a3d58c15bc397750abdc70b774" },
        },
        latest = "0.2.1-rc.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
