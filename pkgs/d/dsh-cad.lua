package = {
    spec = "1",

    name = "dsh-cad",
    description = "deepseek harness 2D and 3D CAD plugin",
    repo = "https://github.com/LAU-MARS/dsh-cad",
    homepage = "https://github.com/LAU-MARS/dsh-cad",
    licenses = {"Apache-2.0"},
    authors = {"LAU-MARS"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-cad",

        versions = {
            ["0.17.0"] = { commit = "1d0a9110e56b2a756a3197cfbee6ca52a6adae80" },
        },
        latest = "0.17.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
