package = {
    spec = "1",

    name = "dsh-fish",
    description = "DSH插件：养一个会自己刷b站会成长的agent：不通过面板配置，通过学习诞生人格。",
    repo = "https://github.com/ssamurias/dsh-fish",
    homepage = "https://github.com/ssamurias/dsh-fish",
    authors = {"ssamurias"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-fish",

        versions = {
            ["0.6.1"] = { commit = "356b200aa899dd1fadf4d100cbcf677205437bf9" },
        },
        latest = "0.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
