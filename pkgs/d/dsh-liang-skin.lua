package = {
    spec = "1",

    name = "dsh-liang-skin",
    description = "DeepSeek Harness 滑动变阻器皮肤",
    repo = "https://github.com/kingOfSoySauce/dsh-liang-skin",
    homepage = "https://github.com/kingOfSoySauce/dsh-liang-skin",
    authors = {"kingOfSoySauce"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-client-liang-intensity-skin",

        versions = {
            ["0.1.3"] = { commit = "3d7ceacb8e75f1e03188d5c50f61da474f6ae2b4" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
