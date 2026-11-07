package = {
    spec = "1",

    name = "dsh-museav-assets",
    description = "DeepSeek Harness 素材浏览插件：按工作区查看 MUSE AV 素材与出图记录，复制素材直链。DSH asset browser for MUSE AV workspaces, image libraries and generation history.",
    repo = "https://github.com/webkubor/dsh-museav-assets",
    homepage = "https://github.com/webkubor/dsh-museav-assets",
    licenses = {"MIT"},
    authors = {"webkubor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-plugins/dsh-museav-assets",

        versions = {
            ["0.1.7"] = { commit = "9429b56d8ac60dea8690bd63c6663ce43dc5a635" },
        },
        latest = "0.1.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
