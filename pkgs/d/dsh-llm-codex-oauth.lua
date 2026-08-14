package = {
    spec = "1",

    name = "dsh-llm-codex-oauth",
    description = "在 dsh（DeepSeek Harness）里使用你的 ChatGPT / Codex 订阅。插件通过 OpenAI Codex 的 OAuth 流程登录 ChatGPT 账号，把订阅额度暴露成 dsh 的 `codex-oauth` 模型提供方。",
    repo = "https://github.com/Player-MINEPIG/dsh-llm-codex-oauth",
    homepage = "https://github.com/Player-MINEPIG/dsh-llm-codex-oauth",
    licenses = {"MIT"},
    authors = {"Player-MINEPIG"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-llm-codex-oauth",

        versions = {
            ["0.3.6"] = { commit = "57d7aa96d9a84bc53bf5fe689b764304d4191d0c" },
        },
        latest = "0.3.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
