package = {
    spec = "1",

    name = "dsh-router-flash",
    description = "DSH bundle 插件：V4 Flash 神模式（opencode-go）agent preset 分发包，dsh plugin add 安装后自动同步 router-flash preset。DSH agent preset bundle for DeepSeek V4 Flash godmode.",
    repo = "https://github.com/xiaoxianyu-office/dsh-router-flash",
    homepage = "https://github.com/xiaoxianyu-office/dsh-router-flash",
    licenses = {"MIT"},
    authors = {"xiaoxianyu-office"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-router-flash",

        versions = {
            ["0.1.0"] = { commit = "554d3aedf76202f82eb263833f55d934774cc58f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
