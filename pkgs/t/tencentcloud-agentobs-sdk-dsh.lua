package = {
    spec = "1",

    name = "tencentcloud-agentobs-sdk-dsh",
    description = "tencentcloud-agentobs-sdk-dsh 是一个 DeepSeek Harness (DSH) 可观测插件，直接将 GenAI trace 数据上报到腾讯云日志服务 (CLS)。  它观察 DSH 原生的 session、agent loop、LLM stream 和 tool 生命周期，将其转换为 腾讯云AI Agent可观测规范的 5 层 span 层级模型（entry → agent → step → chat → tool），并通过 tencentcloud-cls-sdk-js 直接上报到 CLS，无需额外部署 OTLP 收集器或 sidecar。",
    repo = "https://github.com/TencentCloud/tencentcloud-agentobs-sdk-dsh",
    homepage = "https://github.com/TencentCloud/tencentcloud-agentobs-sdk-dsh",
    licenses = {"Apache-2.0"},
    authors = {"TencentCloud"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "tencentcloud-agentobs-sdk-dsh",

        versions = {
            ["0.0.3"] = { commit = "882be435d30b79934232f60055d31123bce0c858" },
        },
        latest = "0.0.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
