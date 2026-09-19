package = {
    spec = "1",

    name = "dsh-continual-evolve",
    description = "Continual self-evolution plugin for DeepSeek Harness: versioned, auditable, rollback-safe harness state refined from session trajectories, with a benchmark-driven validation loop.",
    repo = "https://github.com/ZK-Andy/dsh-continual-evolve",
    homepage = "https://github.com/ZK-Andy/dsh-continual-evolve",
    licenses = {"MIT"},
    authors = {"ZK-Andy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-continual-evolve",

        versions = {
            ["0.1.1"] = { commit = "427992191e7fbf90634682eda4d2daedb5fdffe5" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
