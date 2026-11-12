package = {
    spec = "1",

    name = "dsh-archived-chats",
    description = "本地归档聊天中心：搜索和预览完整对话、历史版本与恢复副本、ZIP 备份、可撤销回收站、保留策略及来源与分支。Local archived-chat manager: full-text preview, local history, restore-as-copy, ZIP backups, Recycle Bin, retention, and Origins & Branches.",
    repo = "https://github.com/Ultronen/dsh-archived-chats",
    homepage = "https://github.com/Ultronen/dsh-archived-chats",
    licenses = {"MIT"},
    authors = {"Ultronen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-archived-chats",

        versions = {
            ["1.0.0"] = { commit = "aebcd9aad14063a3cc3963e1acf2e6f4c0350246" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
