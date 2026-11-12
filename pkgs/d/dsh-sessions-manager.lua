package = {
    spec = "1",

    name = "dsh-sessions-manager",
    description = "DSH 会话管理插件：设置面板 + 侧边栏双入口，归档/恢复/跨工作区移动/软删进回收站；回收站可恢复·批量清空·7/30/90 天自动清理，按标题·会话 ID·工作区搜索，带磁盘与血统详情；已适配 DSH 0.1.7 与 0.2.0（v4 日志，旧格式会话亦可移动，活跃会话排队移动）。Session Manager for DeepSeek Harness — archive/restore/move/trash lifecycle, search & per-session stats, 0.1.7 & 0.2.0 ready (v4 session format). | macOS/Windows/Linux |",
    repo = "https://github.com/TOBYCAI/dsh-sessions-manager",
    homepage = "https://github.com/TOBYCAI/dsh-sessions-manager",
    licenses = {"MIT"},
    authors = {"TOBYCAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-sessions-manager",

        versions = {
            ["3.7.5"] = { commit = "5fc4f46a804a5bf79f248852cc06cd77ffe104ea" },
        },
        latest = "3.7.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
