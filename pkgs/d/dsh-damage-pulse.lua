package = {
    spec = "1",

    name = "dsh-damage-pulse",
    description = "DeepSeek Harness token balance monitor with game-style damage pulse animations",
    repo = "https://github.com/wssfk12138/dsh-damage-pulse",
    homepage = "https://github.com/wssfk12138/dsh-damage-pulse",
    licenses = {"MIT"},
    authors = {"wssfk12138"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-damage-pulse",

        versions = {
            ["0.2.0"] = { commit = "34354540fea643fa0d6086e641d6fb69d4c2d840" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
