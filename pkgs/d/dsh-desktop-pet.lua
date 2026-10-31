package = {
    spec = "1",

    name = "dsh-desktop-pet",
    description = "DeepSeek Harness：鲸鱼娘桌宠！",
    repo = "https://github.com/xiaoshihou514/dsh-desktop-pet",
    homepage = "https://github.com/xiaoshihou514/dsh-desktop-pet",
    licenses = {"MIT"},
    authors = {"xiaoshihou514"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-desktop-pet",

        versions = {
            ["0.1.0"] = { commit = "f10a5cc5d2d91f17cd7d14e1389c80c0eb859b74" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
