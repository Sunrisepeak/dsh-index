package = {
    spec = "1",

    name = "dsh-personalize",
    description = "Per-host personalization for DSH: custom instructions, local long-term memory, and reply-tone presets.",
    repo = "https://github.com/Zephyr-vibe/dsh-personalize",
    homepage = "https://github.com/Zephyr-vibe/dsh-personalize",
    licenses = {"MIT"},
    authors = {"Zephyr-vibe"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-personalize",

        versions = {
            ["0.1.2"] = { commit = "96f5525c0b65819fdb12c88cf1a9309747095c1f" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
