package = {
    spec = "1",

    name = "dsh-plugin-manager",
    description = "DSH 插件管理器:在 DeepSeek Harness 设置面板内嵌 GUI,管理 MCP 服务 / Skills / 内置插件包,改动热生效无需重启",
    repo = "https://github.com/liqichen/dsh-plugin-manager",
    homepage = "https://github.com/liqichen/dsh-plugin-manager",
    licenses = {"MIT"},
    authors = {"liqichen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-manager",

        versions = {
            ["0.1.0"] = { commit = "36a73f0174f0714243ba01afcc9a5ffaa36b0b04" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
