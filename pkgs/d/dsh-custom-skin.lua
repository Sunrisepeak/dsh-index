package = {
    spec = "1",

    name = "dsh-custom-skin",
    description = "DSH自定义壁纸/皮肤插件——Custom wallpapers and translucent skins for DeepSeek Harness Web",
    repo = "https://github.com/SLin-code/dsh-custom-skin",
    homepage = "https://github.com/SLin-code/dsh-custom-skin",
    licenses = {"MIT"},
    authors = {"SLin-code"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-custom-skin",

        versions = {
            ["0.1.0"] = { commit = "8dcf03028b8026cda2213218340b9c1341186b85" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
