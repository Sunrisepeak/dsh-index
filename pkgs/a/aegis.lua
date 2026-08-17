package = {
    spec = "1",

    name = "aegis",
    description = "Make AI coding agents architecture-aware: baseline-first, evidence-verified, drift-checked, and safe across long tasks.",
    repo = "https://github.com/GanyuanRan/Aegis",
    homepage = "https://github.com/GanyuanRan/Aegis",
    licenses = {"MIT"},
    authors = {"GanyuanRan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "aegis",

        versions = {
            ["2.8.1"] = { commit = "c8483d63f5b3826bebf30ec6cf84d76cdab03907" },
            ["2.8.0"] = { commit = "21b27d23598ef492834427e2a1381b744f66b787" },
        },
        latest = "2.8.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
