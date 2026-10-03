package = {
    spec = "1",

    name = "dsh-qq2006",
    description = "DSH (DeepSeek Harness) 的 QQ2006 皮肤插件：注册 qq2006 主题、镜像 body[data-ds-skin]、全局皮肤表与完整素材",
    repo = "https://github.com/LaplaceYoung/dsh-qq2006",
    homepage = "https://github.com/LaplaceYoung/dsh-qq2006",
    licenses = {"MIT"},
    authors = {"LaplaceYoung"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-qq2006",

        versions = {
            ["0.1.0"] = { commit = "fa3493ceb748171728113aba1aaf606d733790a0" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
