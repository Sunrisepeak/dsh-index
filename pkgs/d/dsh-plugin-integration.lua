package = {
    spec = "1",

    name = "dsh-plugin-integration",
    description = "DeepSeek Harness (DSH) 插件整合中心：动态发现、打标分类、重叠/兼容检测、一键启停与失效检测",
    repo = "https://github.com/MutaLucem/dsh-plugin-integration",
    homepage = "https://github.com/MutaLucem/dsh-plugin-integration",
    licenses = {"MIT"},
    authors = {"MutaLucem"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-integration",

        versions = {
            ["1.3.10"] = { commit = "0f720b7e53c0633b77e48c04c8bb8e06d16b7a37" },
        },
        latest = "1.3.10",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
