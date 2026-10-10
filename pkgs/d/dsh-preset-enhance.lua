package = {
    spec = "1",

    name = "dsh-preset-enhance",
    description = "SillyTavern preset mode, macro engine and editor for DeepSeek Harness",
    repo = "https://github.com/bychv/dsh-preset-enhance",
    homepage = "https://github.com/bychv/dsh-preset-enhance",
    licenses = {"MIT"},
    authors = {"bychv"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-preset-enhance",

        versions = {
            ["0.3.3-rc.3"] = { commit = "11143fa945546908a8eb9b16d5365453cd8aedc4" },
        },
        latest = "0.3.3-rc.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
