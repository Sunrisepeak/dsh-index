package = {
    spec = "1",

    name = "dsh-harbor",
    description = "DeepSeek Harness (DSH) plugin: a read-only ledger for the plugins you already have installed — a capability inventory with file:line evidence, declared-vs-detected reconciliation, cross-profile version drift, and a diff of what changed since the last scan.",
    repo = "https://github.com/ZSeven-W/dsh-harbor",
    homepage = "https://github.com/ZSeven-W/dsh-harbor",
    licenses = {"MIT"},
    authors = {"ZSeven-W"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zseven-w/dsh-harbor",

        versions = {
            ["0.1.0-rc.2"] = { commit = "d0609b89223fddfa3563ccf18c524b4c4094ff35" },
        },
        latest = "0.1.0-rc.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
