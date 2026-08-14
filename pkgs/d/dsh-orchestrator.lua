package = {
    spec = "1",

    name = "dsh-orchestrator",
    description = "【编排模式】为 DeepSeek Harness 提供多智能体编排模式：主智能体分解分派、worker 全网格互通，支持逐 worker 指定模型与思考强度",
    repo = "https://github.com/zibo2025/dsh-orchestrator",
    homepage = "https://github.com/zibo2025/dsh-orchestrator",
    licenses = {"MIT"},
    authors = {"zibo2025"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-orchestrator",

        versions = {
            ["0.1.3"] = { commit = "e1710f57f78aeb3af13e35c3d960dd5b185cbc6f" },
        },
        latest = "0.1.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
