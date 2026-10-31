package = {
    spec = "1",

    name = "dsh-message-rail",
    description = "Codex 风格左侧消息导航轨道：等距刻度 + 悬停预览 + 点击跳转用户消息 · DSH Web 插件",
    repo = "https://github.com/wx-yss/dsh-message-rail",
    homepage = "https://github.com/wx-yss/dsh-message-rail",
    licenses = {"MIT"},
    authors = {"wx-yss"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-message-rail",

        versions = {
            ["0.1.4"] = { commit = "2a5d8645ca0da6826837a395cd1d6a5611e9745f" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
