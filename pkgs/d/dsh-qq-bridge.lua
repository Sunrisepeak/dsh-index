package = {
    spec = "1",

    name = "dsh-qq-bridge",
    description = "deepseek harness插件，连接QQ / DSH plugin for connecting QQ",
    repo = "https://github.com/TomoyoNatsume/dsh-qq-bridge",
    homepage = "https://github.com/TomoyoNatsume/dsh-qq-bridge",
    licenses = {"MIT"},
    authors = {"TomoyoNatsume"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-qq-bridge",

        versions = {
            ["1.0.0"] = { commit = "70173e1c0234b6fcbc8c625db3e3d85f75a7694e" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
