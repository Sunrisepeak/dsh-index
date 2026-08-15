package = {
    spec = "1",

    name = "gal-view",
    description = "把dsh会话界面切换成galgame游戏界面的插件",
    repo = "https://github.com/Ayase34/gal-view",
    homepage = "https://github.com/Ayase34/gal-view",
    licenses = {"MIT"},
    authors = {"Ayase34"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "gal-view",

        versions = {
            ["0.3.2"] = { commit = "3b5a6411d01fcf0c92623a20adbf5e94e17a76ae" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
