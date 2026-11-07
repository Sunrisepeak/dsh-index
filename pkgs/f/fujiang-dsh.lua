package = {
    spec = "1",

    name = "fujiang-dsh",
    description = "富江DSH完美破甲｜富江破甲 DSH 本地插件，内置提示词规则，支持 Windows 一键安装、环境自动准备与一键卸载，全中文使用说明。",
    repo = "https://github.com/c3cvld7aag/fujiang-dsh",
    homepage = "https://github.com/c3cvld7aag/fujiang-dsh",
    authors = {"c3cvld7aag"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "fujiang-armor",

        versions = {
            ["0.4.3"] = { commit = "ab86ddcd169f0f13bc74923b6ed95eda55224931" },
        },
        latest = "0.4.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
