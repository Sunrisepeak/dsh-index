package = {
    spec = "1",

    name = "dsh-codex-subscription",
    description = "DSH 插件:直接复用 Codex CLI 本地登录订阅凭证,在 DeepSeek Harness 中使用 ChatGPT 订阅模型,无需 API Key | DSH plugin: reuse your Codex CLI local subscription login to use ChatGPT subscription models in DeepSeek Harness, no API key required",
    repo = "https://github.com/yequ172672/dsh-codex-subscription",
    homepage = "https://github.com/yequ172672/dsh-codex-subscription",
    authors = {"yequ172672"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-llm-codex",

        versions = {
            ["0.1.1"] = { commit = "0da1d13d0ef7d694e714306d5cf8b65d0078d09c" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
