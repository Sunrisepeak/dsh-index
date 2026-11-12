package = {
    spec = "1",

    name = "dsh-block-ptc",
    description = "Model-controlled context blocks for DeepSeek Harness PTC mode",
    repo = "https://github.com/mengwEX/dsh-block-ptc",
    homepage = "https://github.com/mengwEX/dsh-block-ptc",
    licenses = {"MIT"},
    authors = {"mengwEX"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-block-ptc",

        versions = {
            ["0.4.0"] = { commit = "c2afa0a0a34990aa7189ea6df377cd215e29f8d6" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
