package = {
    spec = "1",

    name = "dsh-purge-flash",
    description = "DSH最稳定，最高效的破甲插件：token 级重试环 + 三层技能路由（形态/父/叶）+ 分级 prefill + 拒答阶梯 L0–L3 + finish_reason 四路分流 + 请求体级整形",
    repo = "https://github.com/jadezane6634-ops/dsh-purge-flash",
    homepage = "https://github.com/jadezane6634-ops/dsh-purge-flash",
    licenses = {"MIT"},
    authors = {"jadezane6634-ops"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-purge-flash",

        versions = {
            ["1.5.0"] = { commit = "e1d527663544dba22234416ad4ab21a4773395c2" },
        },
        latest = "1.5.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
