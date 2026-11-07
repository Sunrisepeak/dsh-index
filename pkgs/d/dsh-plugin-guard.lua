package = {
    spec = "1",

    name = "dsh-plugin-guard",
    description = "Install safety net for DeepSeek Harness: pre-install snapshots, one-click/automatic rollback, guarded boot, and incident reports that auto-trigger agent analysis. 中文: DeepSeek Harness 插件安装安全网（安装前自动快照、一键/自动回退、守护启动、事故报告自动触发 Agent 分析）。",
    repo = "https://github.com/lxzy-7/dsh-plugin-guard",
    homepage = "https://github.com/lxzy-7/dsh-plugin-guard",
    licenses = {"MIT"},
    authors = {"lxzy-7"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-guard",

        versions = {
            ["0.2.2"] = { commit = "d0372eb1703d6fca5165245d5b3f780ac7c755a7" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
