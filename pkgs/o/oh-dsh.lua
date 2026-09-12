package = {
    spec = "1",

    name = "oh-dsh",
    description = "一站式 DeepSeek Harness 社区发行版：TUI、桌面端与 Web UI 三种形态统一体验，支持分层安装、一步到位，免去手工整合打包。",
    repo = "https://github.com/hust-open-atom-club/oh-dsh",
    homepage = "https://github.com/hust-open-atom-club/oh-dsh",
    licenses = {"MIT"},
    authors = {"hust-open-atom-club"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@oh-dsh/desktop",

        versions = {
            ["0.1.4"] = { commit = "81276e0d7ff0c6fd2e50a7564ea9cc7d0275bcae" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
