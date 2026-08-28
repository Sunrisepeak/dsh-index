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
            ["2.9.0"] = { commit = "f7ae3a7b116ae3dbb2f6e901a1bae0a403d5f09a" },
            ["2.8.9"] = { commit = "064cb379be322edfdcb60026d968cbc79fd619e6" },
            ["2.8.8"] = { commit = "1dc0faa633039983e58b82893e3268fced6ac4d3" },
            ["2.8.5"] = { commit = "fea84dd545385ebdbe1c7ceab0d2afb8fe9d4600" },
            ["2.8.4"] = { commit = "d5bda9fb9df0f94587283954f1c155816abe9002" },
            ["2.8.3"] = { commit = "75fe591f77766b5e1e601ea00cd4770dc8b2e74f" },
            ["2.8.1"] = { commit = "c8483d63f5b3826bebf30ec6cf84d76cdab03907" },
            ["2.8.0"] = { commit = "21b27d23598ef492834427e2a1381b744f66b787" },
        },
        latest = "2.9.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
