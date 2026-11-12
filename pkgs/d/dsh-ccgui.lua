package = {
    spec = "1",

    name = "dsh-ccgui",
    description = "在 DeepSeek Harness 里直接使用 Claude Code、Codex、PI、OMP 等 Agent CLI",
    repo = "https://github.com/zhukunpenglinyutong/dsh-ccgui",
    homepage = "https://github.com/zhukunpenglinyutong/dsh-ccgui",
    licenses = {"MIT"},
    authors = {"zhukunpenglinyutong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ccgui",

        versions = {
            ["1.0.6"] = { commit = "2307b86ccaeceb9a79bc1007ec6f836fc00e4ea6" },
        },
        latest = "1.0.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
