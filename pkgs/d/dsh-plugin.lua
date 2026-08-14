package = {
    spec = "1",

    name = "dsh-plugin",
    description = "Upload images and files to your image host from DeepSeek Harness, powered by PicGo",
    repo = "https://github.com/PicGo/dsh-plugin",
    homepage = "https://github.com/PicGo/dsh-plugin",
    authors = {"PicGo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@picgo/dsh-plugin",

        versions = {
            ["0.1.0"] = { commit = "2f7dd01339325641af489715a1e4948e4d204afa" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
