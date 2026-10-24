package = {
    spec = "1",

    name = "dsh-llm-hub",
    description = "给 DSH 模型页补上官方适配器缺的那半：网关可达性探测、模型目录拉取并勾选写回、余额/配额常驻、协议与接入地址可见。零运行时依赖，不改动 DSH 安装。",
    repo = "https://github.com/webkubor/dsh-llm-hub",
    homepage = "https://github.com/webkubor/dsh-llm-hub",
    licenses = {"MIT"},
    authors = {"webkubor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-plugins/dsh-llm-hub",

        versions = {
            ["1.9.5"] = { commit = "1689b8a8a2b79545a6151efa0df87963c3f2d99d" },
        },
        latest = "1.9.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
