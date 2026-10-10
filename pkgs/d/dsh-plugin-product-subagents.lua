package = {
    spec = "1",

    name = "dsh-plugin-product-subagents",
    description = "Role-based Codex / Claude Code / ACP subagent providers for the DeepSeek Harness — continuable children, durable session recovery, per-role product permissions, and delegation with a permission ceiling.",
    repo = "https://github.com/shaokeyibb/dsh-plugin-product-subagents",
    homepage = "https://github.com/shaokeyibb/dsh-plugin-product-subagents",
    licenses = {"MIT"},
    authors = {"shaokeyibb"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-product-subagents",

        versions = {
            ["0.3.1"] = { commit = "9149aaa8b7b904273c999eff00aa6ca7e85b8720" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
