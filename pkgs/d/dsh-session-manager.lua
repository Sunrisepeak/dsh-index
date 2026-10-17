package = {
    spec = "1",

    name = "dsh-session-manager",
    description = "DSH 会话管理插件：删除（回收站恢复/彻底清除）、统计、继续/暂停、打开日志目录、对话顶部抽屉、工作区分组与排序、上下文压缩阈值设置。DSH session manager: delete with trash/restore/purge, stats, continue/pause, log folder, header drawer, workspace grouping, context compaction threshold.",
    repo = "https://github.com/dream12347/dsh-session-manager",
    homepage = "https://github.com/dream12347/dsh-session-manager",
    licenses = {"MIT"},
    authors = {"dream12347"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-manager",

        versions = {
            ["0.1.7"] = { commit = "26cce76a51125318589bd14ec21a8e1c9fd2fa9b" },
        },
        latest = "0.1.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
