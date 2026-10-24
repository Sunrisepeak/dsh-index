package = {
    spec = "1",

    name = "dsh-connect-trae",
    description = "Connect locally signed-in Trae models to DeepSeek Harness with a read-only credits overview.",
    repo = "https://github.com/dingminhua/dsh-connect-trae",
    homepage = "https://github.com/dingminhua/dsh-connect-trae",
    licenses = {"MIT"},
    authors = {"dingminhua"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-connect-trae",

        versions = {
            ["2.0.4"] = { commit = "9c7c1139b707e11933ae107a8e0213b4ab229614" },
        },
        latest = "2.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
