package = {
    spec = "1",

    name = "dsh-cuigengji-plugin",
    description = "催更姬：给大肥鱼一个小说工作台。写正文、理设定、画情节，和 AI 一起讨论、续写与改稿。",
    repo = "https://github.com/mistnest/dsh-cuigengji-plugin",
    homepage = "https://github.com/mistnest/dsh-cuigengji-plugin",
    licenses = {"MIT"},
    authors = {"mistnest"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-cuigengji-plugin",

        versions = {
            ["0.4.3"] = { commit = "5facb9634b96a71f4ec0881556748befbb9ad32e" },
        },
        latest = "0.4.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
