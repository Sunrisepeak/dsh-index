package = {
    spec = "1",

    name = "dsh-model-router",
    description = "模型路由与成本优化器：简单问题 flash 直答、故障自动降级、会话 token/缓存/成本实时面板 | Model router & cost optimizer for DeepSeek Harness: flash quick-answers for simple questions, failure fallback, live token/cache/cost panel",
    repo = "https://github.com/tianji-qingtian/dsh-model-router",
    homepage = "https://github.com/tianji-qingtian/dsh-model-router",
    licenses = {"MIT"},
    authors = {"tianji-qingtian"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-model-router",

        versions = {
            ["0.8.1"] = { commit = "121ee7d4d9f0b7e063ff1533d8ac20c2bf63f128" },
        },
        latest = "0.8.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
