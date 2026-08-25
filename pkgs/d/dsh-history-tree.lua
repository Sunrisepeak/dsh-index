package = {
    spec = "1",

    name = "dsh-history-tree",
    description = "Codex-style conversation turn timeline and hover history overview for DSH Web UI",
    repo = "https://github.com/z953218350/dsh-history-tree",
    homepage = "https://github.com/z953218350/dsh-history-tree",
    licenses = {"MIT"},
    authors = {"z953218350"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-history-tree",

        versions = {
            ["1.0.3"] = { commit = "24de7e3e124dcf2a5def69fc5dc2e32f4e6ed501" },
        },
        latest = "1.0.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
