package = {
    spec = "1",

    name = "dsh-liketavern",
    description = "A DeepSeek Harness (dsh) plugin — turns dsh web into a SillyTavern-style roleplay frontend: character cards, prompt presets, lorebooks, personas, BM25 long-term memory, world-state deltas, and rollback-able floor operations, all on the dsh agent runtime.",
    repo = "https://github.com/Amakurai/dsh-liketavern",
    homepage = "https://github.com/Amakurai/dsh-liketavern",
    licenses = {"MIT"},
    authors = {"Amakurai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-liketavern",

        versions = {
            ["0.1.5"] = { commit = "85fd976b43e99bf44aeabe2cf3d23e48fa70a4a8" },
        },
        latest = "0.1.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
