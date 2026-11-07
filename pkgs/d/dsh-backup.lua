package = {
    spec = "1",

    name = "dsh-backup",
    description = "One command backs up & restores all of ~/.dsh for DeepSeek Harness: /backup, scheduled auto-backup, upgrade snapshots, session-log doctor & repair, out-of-process rescue console, credential redaction, GitHub sync. 一条命令备份/恢复 DSH 全部数据：升级快照、会话日志体检修复、起不来也能自救的救援通道、凭据脱敏。",
    repo = "https://github.com/xiaoyuyu6420/dsh-backup",
    homepage = "https://github.com/xiaoyuyu6420/dsh-backup",
    licenses = {"MIT"},
    authors = {"xiaoyuyu6420"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xiaoyuyu6420/dsh-backup",

        versions = {
            ["0.9.1"] = { commit = "5a1dc29f0e6b9b6bf0f47cbbab5ea60307cc9062" },
        },
        latest = "0.9.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
