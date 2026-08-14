package = {
    spec = "1",

    name = "dsh-whale-report",
    description = "🐋 鲸鱼记事本 — 你的 Agent 年度报告：从会话事件日志生成日报/周报/月报/年报，任意区间、只读不改写",
    repo = "https://github.com/SenmuuuuW/dsh-whale-report",
    homepage = "https://github.com/SenmuuuuW/dsh-whale-report",
    licenses = {"MIT"},
    authors = {"SenmuuuuW"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-report",

        versions = {
            ["0.1.0"] = { commit = "a1d2272c43aa9fc5220d1a71b2a5268abfdd47d4" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
