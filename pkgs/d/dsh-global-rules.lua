package = {
    spec = "1",

    name = "dsh-global-rules",
    description = "在 DeepSeek Harness Web 设置面板中编辑 ~/.dsh/AGENTS.md 全局规则的插件",
    repo = "https://github.com/badai147/dsh-global-rules",
    homepage = "https://github.com/badai147/dsh-global-rules",
    licenses = {"MIT"},
    authors = {"badai147"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-global-rules",

        versions = {
            ["0.1.0"] = { commit = "2ed39cc22c636d09ed7b65c30805a523fc713f04" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
