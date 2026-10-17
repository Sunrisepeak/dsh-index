package = {
    spec = "1",

    name = "dsh-plugin-mobile-gateway",
    description = "以websocket为通信方式的dsh网关插件，支持在同一网域内移动端的接入，实现移动端的dsh app",
    repo = "https://github.com/Clarklevis1995/dsh-plugin-mobile-gateway",
    homepage = "https://github.com/Clarklevis1995/dsh-plugin-mobile-gateway",
    licenses = {"MIT"},
    authors = {"Clarklevis1995"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-mobile-gateway",

        versions = {
            ["0.7.2"] = { commit = "0128ece31e6492cae26be5433cf3d218263d4d7c" },
        },
        latest = "0.7.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
