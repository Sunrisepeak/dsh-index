package = {
    spec = "1",

    name = "sgme",
    description = "你的 AI，从此记得你——拾光记忆引擎，它记得你们聊过的每一件事，还会主动关心你。",
    repo = "https://github.com/freehul/sgme",
    homepage = "https://github.com/freehul/sgme",
    licenses = {"MIT"},
    authors = {"freehul"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-sgme",

        versions = {
            ["0.1.1"] = { commit = "6f8343731a5a9abf54ddf446cd3f6373518cf6bd" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
