package = {
    spec = "1",

    name = "better-dsh-session-deletetool",
    description = "Delete DSH conversations instead of archiving them, see the whole family a conversation spawned (its subagents and derived conversations), and delete in bulk. / 真正删除 DeepSeek Harness 里的会话，并看清它生出的子智能体与派生对话。",
    repo = "https://github.com/Lzcdebear/better-dsh-session-deletetool",
    homepage = "https://github.com/Lzcdebear/better-dsh-session-deletetool",
    licenses = {"MIT"},
    authors = {"Lzcdebear"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "better-dsh-session-deletetool",

        versions = {
            ["0.4.1"] = { commit = "387e75d437a2b6d4f4ccd93d1b82528a23a35d9b" },
        },
        latest = "0.4.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
