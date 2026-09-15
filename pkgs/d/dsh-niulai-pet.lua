package = {
    spec = "1",

    name = "dsh-niulai-pet",
    description = "牛来桌宠：agent 任务完成它就蹦出来喊「妈～～妈～～」——dsh 纯客户端桌宠插件（6 皮肤/签名动作/合成叫声）",
    repo = "https://github.com/whitefirer/dsh-niulai-pet",
    homepage = "https://github.com/whitefirer/dsh-niulai-pet",
    licenses = {"MIT"},
    authors = {"whitefirer"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-niulai-pet",

        versions = {
            ["0.4.9"] = { commit = "c29b878338adadaaa906e9aeca6b665f250beeeb" },
        },
        latest = "0.4.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
