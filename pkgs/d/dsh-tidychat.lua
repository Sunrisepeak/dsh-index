package = {
    spec = "1",

    name = "dsh-tidychat",
    description = "DSH Web 会话时间线整理：自动折叠 / 分隔线 / 左缘定位条 / 四开关设置",
    repo = "https://github.com/BananaSoldier01/dsh-tidychat",
    homepage = "https://github.com/BananaSoldier01/dsh-tidychat",
    licenses = {"MIT"},
    authors = {"BananaSoldier01"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@bananasoldier01/dsh-tidychat",

        versions = {
            ["0.2.5"] = { commit = "4bc374f56bece8be6efb3d5c4279233475867cb8" },
        },
        latest = "0.2.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
