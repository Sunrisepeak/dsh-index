package = {
    spec = "1",

    name = "dsh-liquid-glass",
    description = "Wallpaper plus optional Liquid Glass overlay for DeepSeek Harness Web UI",
    repo = "https://github.com/xingyingyuzhui/dsh-liquid-glass",
    homepage = "https://github.com/xingyingyuzhui/dsh-liquid-glass",
    licenses = {"MIT"},
    authors = {"xingyingyuzhui"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-liquid-glass",

        versions = {
            ["0.12.82"] = { commit = "573a81d66ddff86216a61ebee4c755ed49ae31de" },
        },
        latest = "0.12.82",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
