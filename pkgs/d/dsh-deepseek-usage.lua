package = {
    spec = "1",

    name = "dsh-deepseek-usage",
    description = "DeepSeek API 用量监测 DSH 插件：悬浮球 + 展开面板，展示开放平台真实余额、累计消费、今日消费、请求次数、Tokens 与分模型用量，支持手动登录获取 userToken。",
    repo = "https://github.com/mmzm0808/dsh-deepseek-usage",
    homepage = "https://github.com/mmzm0808/dsh-deepseek-usage",
    authors = {"mmzm0808"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deepseek-usage",

        versions = {
            ["0.1.0"] = { commit = "5d8021a3756f25e5217974f563cc06801dbd3e95" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
