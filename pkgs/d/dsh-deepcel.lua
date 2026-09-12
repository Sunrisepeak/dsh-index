package = {
    spec = "1",

    name = "dsh-deepcel",
    description = "一款模仿 excel 的 dsh 皮肤",
    repo = "https://github.com/Small-tailqwq/dsh-deepcel",
    homepage = "https://github.com/Small-tailqwq/dsh-deepcel",
    licenses = {"BSD-3-Clause"},
    authors = {"Small-tailqwq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-client-ui-skin-deepcel",

        versions = {
            ["0.0.1"] = { commit = "85ba195c685d495720d35bd757ca461bb8586ea8" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
