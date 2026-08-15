package = {
    spec = "1",

    name = "dsh-provider-model-configurator",
    description = "DSH 模型 Pro:为 DSH WebUI 提供将 pi-ai 预设或任意已配置提供商的模型上下文、输出上限、推理档位与兼容开关一键应用到目标提供商,并集中查看、新建、编辑、复制与删除各提供商模型条目的能力。",
    repo = "https://github.com/LiangYin233/dsh-provider-model-configurator",
    homepage = "https://github.com/LiangYin233/dsh-provider-model-configurator",
    licenses = {"MIT"},
    authors = {"LiangYin233"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-provider-model-configurator",

        versions = {
            ["0.3.9"] = { commit = "70f88112c7d92fadeb93e46f5dcb8b1f3ae6eba3" },
        },
        latest = "0.3.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
