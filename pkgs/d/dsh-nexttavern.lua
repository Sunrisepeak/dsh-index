package = {
    spec = "1",

    name = "dsh-nexttavern",
    description = "原生 Agent 驱动的长篇角色扮演：交互式创作、主动世界书、动态记忆、多角色推演与小说导出。创作一个世界，走进它，再把它带走。",
    repo = "https://github.com/a86582751/dsh-nexttavern",
    homepage = "https://github.com/a86582751/dsh-nexttavern",
    licenses = {"MIT"},
    authors = {"a86582751"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-nexttavern",

        versions = {
            ["0.1.2"] = { commit = "6d9ec4783f13443bb69ead5ff1dbc79093976f54" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
