package = {
    spec = "1",

    name = "dsh-dafeiyu",
    description = "Desktop-native BigFish companion for DeepSeek Harness — real Agent status, always on top on Windows.",
    repo = "https://github.com/QCYTSN/dsh-dafeiyu",
    homepage = "https://github.com/QCYTSN/dsh-dafeiyu",
    licenses = {"MIT"},
    authors = {"QCYTSN"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-dafeiyu",

        versions = {
            ["0.1.0-alpha.6"] = { commit = "e94e3c5df205df81c4a2c1e4f17d1419e7b908d3" },
        },
        latest = "0.1.0-alpha.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
