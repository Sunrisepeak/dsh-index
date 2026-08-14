package = {
    spec = "1",

    name = "dsh-workspace-search",
    description = "VS Code-style workspace keyword search for DeepSeek Harness: a Search tab in dsh-better-sidebar",
    repo = "https://github.com/tsonglew/dsh-workspace-search",
    homepage = "https://github.com/tsonglew/dsh-workspace-search",
    licenses = {"MIT"},
    authors = {"tsonglew"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-workspace-search",

        versions = {
            ["0.1.0"] = { commit = "fc2ebaa9f998c592ecc725ca96519ea3b131408a" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
