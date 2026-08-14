package = {
    spec = "1",

    name = "dsh-plugin-market",
    description = "DeepSeek Harness 插件市场：精选目录 + GitHub 实时浏览、中英翻译搜索、安装前静态安全审计闸门。Plugin market for DeepSeek Harness with a pre-install security audit gate.",
    repo = "https://github.com/nanshan1995/DSH-Plugin-Market",
    homepage = "https://github.com/nanshan1995/DSH-Plugin-Market",
    licenses = {"MIT"},
    authors = {"nanshan1995"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dshmarket",

        versions = {
            ["1.1.0"] = { commit = "e08f323838b5a846443640819979d8135829732e" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
