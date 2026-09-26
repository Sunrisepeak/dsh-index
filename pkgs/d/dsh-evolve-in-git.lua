package = {
    spec = "1",

    name = "dsh-evolve-in-git",
    description = "A deepseek-harness plugin, making your agent evolve in customed git repository.",
    repo = "https://github.com/Kytolly/dsh-evolve-in-git",
    homepage = "https://github.com/Kytolly/dsh-evolve-in-git",
    licenses = {"MIT"},
    authors = {"Kytolly"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-evolve-in-git",

        versions = {
            ["0.6.3"] = { commit = "f9c19adbebe3b1117bdd488a4627302b4f37fc3b" },
        },
        latest = "0.6.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
