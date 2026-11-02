package = {
    spec = "1",

    name = "dsh-doyourweb",
    description = "Reference and control existing Chrome and Edge tabs from DeepSeek Harness (DSH plugin + companion extension)",
    repo = "https://github.com/SheepofSheep/dsh-doyourweb",
    homepage = "https://github.com/SheepofSheep/dsh-doyourweb",
    licenses = {"MIT"},
    authors = {"SheepofSheep"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-doyourweb",

        versions = {
            ["0.1.9"] = { commit = "c4f1b9c52c6f1e7e4f70f8b486345325f1b464e7" },
        },
        latest = "0.1.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
