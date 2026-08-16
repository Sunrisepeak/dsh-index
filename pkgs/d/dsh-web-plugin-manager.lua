package = {
    spec = "1",

    name = "dsh-web-plugin-manager",
    description = "在 Web UI 中一键管理 DeepSeek Harness (DSH) 插件：查看、实时启停、安装/卸载、环境管理、插件市场。bundle 与非 bundle 插件全覆盖。",
    repo = "https://github.com/LX2000WASD/dsh-web-plugin-manager",
    homepage = "https://github.com/LX2000WASD/dsh-web-plugin-manager",
    licenses = {"MIT"},
    authors = {"LX2000WASD"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-plugin-manager",

        versions = {
            ["0.4.0"] = { commit = "1162fb2182e5ec61f90614c79dd4900465ffd097" },
            ["0.2.2"] = { commit = "fbef0b5ef7d95aacd4a0006a86674b025529990d" },
        },
        latest = "0.4.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
