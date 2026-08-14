package = {
    spec = "1",

    name = "dsh-llm-oauth",
    description = "DeepSeek Harness plugin: OAuth / subscription-plan LLM providers (Grok, GitHub Copilot, OpenAI Codex, Anthropic, OpenRouter)",
    repo = "https://github.com/ziyou979/dsh-llm-oauth",
    homepage = "https://github.com/ziyou979/dsh-llm-oauth",
    licenses = {"MIT"},
    authors = {"ziyou979"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-llm-oauth",

        versions = {
            ["0.2.0"] = { commit = "362312e5d01cccb5fc74fda130875d500dbaf78c" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
