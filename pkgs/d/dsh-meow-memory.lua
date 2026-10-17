package = {
    spec = "1",

    name = "dsh-meow-memory",
    description = "Cross-session memory plugin for DeepSeek Harness: seven-layer SQLite store (soul/user/project/fact/lesson/topic/rules), BM25 retrieval, per-window dream consolidation. 跨会话七层长期记忆插件。",
    repo = "https://github.com/Phant0Meow/dsh-meow-memory",
    homepage = "https://github.com/Phant0Meow/dsh-meow-memory",
    licenses = {"MIT"},
    authors = {"Phant0Meow"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "meow-memory",

        versions = {
            ["0.10.0"] = { commit = "fbe6bded4b5dcf4c9c66c01a4f866780ea351fcf" },
        },
        latest = "0.10.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
