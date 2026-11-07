package = {
    spec = "1",

    name = "dsh-queue-plus",
    description = "DSH 排队消息增强面板：编辑、删除、插话、排序与批量删除功能",
    repo = "https://github.com/starslittle/dsh-queue-plus",
    homepage = "https://github.com/starslittle/dsh-queue-plus",
    licenses = {"MIT"},
    authors = {"starslittle"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-queue-plus",

        versions = {
            ["0.3.0"] = { commit = "ed6448d4828d5fd5c3933dc3c1e08340b9fbc2f9" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
