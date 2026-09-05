package = {
    spec = "1",

    name = "dsh-usage-plugin",
    description = "DeepSeek Harness 用量与消耗插件（dsh-usage）—— 每次调用的 token 用量/缓存命中统计、峰谷计费、余额查询、CSV/JSON/PNG 导出，可经桌面端一键安装或命令行 dsh plugin add 安装。",
    repo = "https://github.com/feiyang-dev/dsh-usage-plugin",
    homepage = "https://github.com/feiyang-dev/dsh-usage-plugin",
    licenses = {"MIT"},
    authors = {"feiyang-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@feiyang666/deepseekharnessdesktop",

        versions = {
            ["1.4.0"] = { commit = "e5fdaca7a8e93cee1e8dec168c6e20650efe515e" },
        },
        latest = "1.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
