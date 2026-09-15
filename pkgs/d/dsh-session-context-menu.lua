package = {
    spec = "1",

    name = "dsh-session-context-menu",
    description = "更好的右键：DeepSeek Harness 应用封装端的完整原生风格上下文菜单",
    repo = "https://github.com/baihejiangnan/dsh-session-context-menu",
    homepage = "https://github.com/baihejiangnan/dsh-session-context-menu",
    licenses = {"MIT"},
    authors = {"baihejiangnan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@baihejiangnan/dsh-session-context-menu",

        versions = {
            ["0.2.14"] = { commit = "fc9ab4692fc9d1d9825b671c56abf21aeabca938" },
        },
        latest = "0.2.14",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
