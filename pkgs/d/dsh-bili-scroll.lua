package = {
    spec = "1",

    name = "dsh-bili-scroll",
    description = "DSH 插件：每天替你刷一轮 B站，读字幕挑出值得的、写一份日报，值得的 @ 你",
    repo = "https://github.com/c1overzz/dsh-bili-scroll",
    homepage = "https://github.com/c1overzz/dsh-bili-scroll",
    authors = {"c1overzz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-bili-scroll",

        versions = {
            ["0.1.5"] = { commit = "e89712091d5f4c84b651beed1672280f3cb31b3e" },
        },
        latest = "0.1.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
