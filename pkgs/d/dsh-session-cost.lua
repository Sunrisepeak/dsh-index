package = {
    spec = "1",

    name = "dsh-session-cost",
    description = "DSH plugin: estimated DeepSeek API cost per session in the web GUI stats strip",
    repo = "https://github.com/ChengChe106/dsh-session-cost",
    homepage = "https://github.com/ChengChe106/dsh-session-cost",
    licenses = {"MIT"},
    authors = {"ChengChe106"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-cost",

        versions = {
            ["0.1.2"] = { commit = "a858eaaa116f83e0adbf546ce82c27a91e4d478e" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
