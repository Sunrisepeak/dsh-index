package = {
    spec = "1",

    name = "codingns4dsh",
    description = "把外部 Agent CLI、持久终端、工作区调试和远程访问，装进 DSH 原生界面。",
    repo = "https://github.com/jingyi0605/Codingns4DSH",
    homepage = "https://github.com/jingyi0605/Codingns4DSH",
    licenses = {"GPL-3.0"},
    authors = {"jingyi0605"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@jingyi0605/codingns4dsh",

        versions = {
            ["0.2.0-rc3"] = { commit = "1f7cc6daba722ef52ef999c9993a51b3b67e9c93" },
        },
        latest = "0.2.0-rc3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
