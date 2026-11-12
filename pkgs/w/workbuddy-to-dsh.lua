package = {
    spec = "1",

    name = "workbuddy-to-dsh",
    description = "把本机 WorkBuddy 桌面端已登录的模型（DeepSeek / GLM / Kimi / MiniMax 等）变成本地的 OpenAI 与 Anthropic 兼容接口 —— Claude Code / opencode / Cursor / Trae / Cherry Studio / LobeChat 等任意支持自定义 Base URL 的客户端可直连。附网页控制台与 DeepSeek Harness 原生插件。零依赖，仅监听 127.0.0.1。",
    repo = "https://github.com/Ianzhyh/workbuddy-to-dsh",
    homepage = "https://github.com/Ianzhyh/workbuddy-to-dsh",
    licenses = {"MIT"},
    authors = {"Ianzhyh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "workbuddy-to-dsh",

        versions = {
            ["1.9.5"] = { commit = "6f3f6d0b23aa23ca6f62b481636aa31fcc44dec9" },
        },
        latest = "1.9.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
