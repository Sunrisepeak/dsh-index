package = {
    spec = "1",

    name = "dsh-stream-rules",
    description = "模式匹配自动注入 steering rules，不占系统上下文 - Inject rules when needed, without wasting context. Similar to oh-my-pi's \"Time-traveling stream rules\", but with a very simple and compact code implementation.",
    repo = "https://github.com/jiesou/dsh-stream-rules",
    homepage = "https://github.com/jiesou/dsh-stream-rules",
    licenses = {"MIT"},
    authors = {"jiesou"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@jiesou/dsh-stream-rules",

        versions = {
            ["0.1.6"] = { commit = "ba8289e34576e32495a46530fddb35652b134f61" },
        },
        latest = "0.1.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
