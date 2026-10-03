package = {
    spec = "1",

    name = "dsh-plugin-capabilities",
    description = "在 dsh 设置页管理技能与 MCP 服务器，支持从 Claude Code、Codex 导入。",
    repo = "https://github.com/qinyre/dsh-plugin-capabilities",
    homepage = "https://github.com/qinyre/dsh-plugin-capabilities",
    licenses = {"MIT"},
    authors = {"qinyre"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-capabilities",

        versions = {
            ["0.3.10"] = { commit = "e5e3596aff8fe9317a29ea96aa63449e1656ad35" },
        },
        latest = "0.3.10",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
