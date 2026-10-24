package = {
    spec = "1",

    name = "dsh-obsidian",
    description = "Connect DeepSeek Harness (dsh) to a local Obsidian vault: search, read, write, move, and trash notes.",
    repo = "https://github.com/mingzeng21/dsh-obsidian",
    homepage = "https://github.com/mingzeng21/dsh-obsidian",
    licenses = {"MIT"},
    authors = {"mingzeng21"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-obsidian",

        versions = {
            ["0.2.6"] = { commit = "b39d772991fa010a55a67be765e61bfeda1b65f0" },
        },
        latest = "0.2.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
