package = {
    spec = "1",

    name = "dsh-to-figma",
    description = "为 DeepSeek Harness 接入 Figma 原生画布能力：读取与编辑设计、组件与变量、素材导出和截图；本地模式不消耗官方 MCP 调用额度。Native Figma canvas tools for DSH.",
    repo = "https://github.com/Duoasa/DSH-to-Figma",
    homepage = "https://github.com/Duoasa/DSH-to-Figma",
    licenses = {"MIT"},
    authors = {"Duoasa"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-to-figma",

        versions = {
            ["0.3.0"] = { commit = "2cc5a4fb11d1ba47637b65310bb781357c08d5b8" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
