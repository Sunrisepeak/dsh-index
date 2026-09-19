package = {
    spec = "1",

    name = "dsh-museai-tavern",
    description = "MuseAI的DeepSeek Harness插件，可以将你的MuseAI角色放进DSH使用啦！",
    repo = "https://github.com/yejiming/dsh-museai-tavern",
    homepage = "https://github.com/yejiming/dsh-museai-tavern",
    licenses = {"MIT"},
    authors = {"yejiming"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@yejiming/dsh-museai-tavern",

        versions = {
            ["0.0.1"] = { commit = "a7a077adfc52a411c046b06c41ee371cf8ab5d87" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
