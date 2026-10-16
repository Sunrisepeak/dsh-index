package = {
    spec = "1",

    name = "dsh-session-delete",
    description = "DeepSeek Harness 会话删除插件：设置页管理归档会话，真正删除磁盘日志（回收站可还原）+ 批量清理——官方归档只隐藏不删盘，这里补上。",
    repo = "https://github.com/xohmai/dsh-session-delete",
    homepage = "https://github.com/xohmai/dsh-session-delete",
    licenses = {"Apache-2.0"},
    authors = {"xohmai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-delete",

        versions = {
            ["0.5.0"] = { commit = "e508fe106bf8854ed9fb89ce6c10cb05a180a3b7" },
        },
        latest = "0.5.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
