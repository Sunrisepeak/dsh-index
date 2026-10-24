package = {
    spec = "1",

    name = "deepseek-splash-animation",
    description = "给 DSH 加一段自定义开屏动画",
    repo = "https://github.com/KDDKBD/DeepSeek-splash-animation",
    homepage = "https://github.com/KDDKBD/DeepSeek-splash-animation",
    licenses = {"MIT"},
    authors = {"KDDKBD"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-splash-animation",

        versions = {
            ["0.4.5"] = { commit = "bd82a5718507ecb752f04492d9639058ee9291d8" },
        },
        latest = "0.4.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
