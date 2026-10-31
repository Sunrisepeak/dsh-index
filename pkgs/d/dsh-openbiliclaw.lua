package = {
    spec = "1",

    name = "dsh-openbiliclaw",
    description = "OpenBiliClaw 是本地运行的跨平台个性化内容推荐 Agent，持续理解你的兴趣并主动找内容。本仓库是它的 DeepSeek Harness 插件：DSH 界面常驻第四栏（推荐/内容库/对话/画像/设置），注册 22 个 Agent Bridge 工具，让 Agent 也能读推荐、答探测、闭环学习。",
    repo = "https://github.com/whiteguo233/dsh-openbiliclaw",
    homepage = "https://github.com/whiteguo233/dsh-openbiliclaw",
    licenses = {"BSD-3-Clause"},
    authors = {"whiteguo233"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@openbiliclaw/dsh-plugin",

        versions = {
            ["0.3.204"] = { commit = "cce47355dbab5b0944e5850bd07a9a9fedca5dcc" },
        },
        latest = "0.3.204",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
