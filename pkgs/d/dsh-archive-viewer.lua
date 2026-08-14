package = {
    spec = "1",

    name = "dsh-archive-viewer",
    description = "DeepSeek Harness 归档会话管理插件：查看/恢复已归档会话（回到原工作区分组）+ 右上角一键关闭 dsh。MIT 许可，欢迎收录到任何插件合集，注明出处即可。",
    repo = "https://github.com/keepermttl/dsh-archive-viewer",
    homepage = "https://github.com/keepermttl/dsh-archive-viewer",
    licenses = {"MIT"},
    authors = {"keepermttl"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-archive-viewer",

        versions = {
            ["2.0.0"] = { commit = "23fe2b5caf6c8b54fb337206e7cb4a3861aa01cc" },
        },
        latest = "2.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
