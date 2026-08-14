package = {
    spec = "1",

    name = "dsh-btw",
    description = "个人很喜欢 Claude Code 的 /btw，于是为 DSH 做了复刻：共享当前上下文快速旁路提问，不中断主任务，也不写入主会话历史。",
    repo = "https://github.com/iyllyt/dsh-btw",
    homepage = "https://github.com/iyllyt/dsh-btw",
    licenses = {"MIT"},
    authors = {"iyllyt"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-btw",

        versions = {
            ["0.2.0"] = { commit = "0ca9db4bfd864ef510dfd469d13845d5d5b872fb" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
