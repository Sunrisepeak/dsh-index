package = {
    spec = "1",

    name = "dsh-ssh-ops",
    description = "DeepSeek Harness SSH 运维插件：主对话驱动 SSH，带高危命令保护与右侧终端。",
    repo = "https://github.com/caoyiwei850/dsh-ssh-ops",
    homepage = "https://github.com/caoyiwei850/dsh-ssh-ops",
    licenses = {"MIT"},
    authors = {"caoyiwei850"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ssh-ops",

        versions = {
            ["0.2.13"] = { commit = "acc8bfb1d1c8eb2b6b955d4594846f244790ca56" },
        },
        latest = "0.2.13",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
