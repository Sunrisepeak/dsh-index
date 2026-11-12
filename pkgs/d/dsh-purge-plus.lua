package = {
    spec = "1",

    name = "dsh-purge-plus",
    description = "Purge Community Plus - DeepSeek Harness jailbreak plugin, adapted for DSH Desktop 0.2.1-rc.x. Fixes #119 host crash and the toolFilter preset-registration failure.",
    repo = "https://github.com/luowang-ui/dsh-purge-plus",
    homepage = "https://github.com/luowang-ui/dsh-purge-plus",
    licenses = {"MIT"},
    authors = {"luowang-ui"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-purge-plus",

        versions = {
            ["1.6.1"] = { commit = "111ebe489308fb8b8faf8fdf748095029790fdd6" },
        },
        latest = "1.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
