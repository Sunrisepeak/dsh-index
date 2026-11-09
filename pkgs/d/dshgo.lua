package = {
    spec = "1",

    name = "dshgo",
    description = "DSH Go —— 在手机/平板上用 DeepSeek Harness。Android App + 让电脑可达的 DSH 插件。",
    repo = "https://github.com/xiazhi88/dshgo",
    homepage = "https://github.com/xiazhi88/dshgo",
    licenses = {"MIT"},
    authors = {"xiazhi88"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xiazhi88/dshgo",

        versions = {
            ["2.0.5"] = { commit = "f213fb4b861178e71025465d0f1d6fb659444e2c" },
        },
        latest = "2.0.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
