package = {
    spec = "1",

    name = "dsh-llm-fallbacks",
    description = "An dsh plugin for role-based LLM retry&fallback strategy. 基于角色的模型重试备用策略插件",
    repo = "https://github.com/btspoony/dsh-llm-fallbacks",
    homepage = "https://github.com/btspoony/dsh-llm-fallbacks",
    licenses = {"MIT"},
    authors = {"btspoony"},

    status = "dev",
    categories = {"dsh-plugin", "provider"},
    keywords = {"dsh", "fallbacks", "subagents"},

    dsh = {
        bundle_name = "dsh-llm-fallbacks",

        versions = {
            ["0.1.0-alpha.1"] = { commit = "21fbed9fc8e3dd33b66db56d9097622a77483b1d" },
        },
        latest = "0.1.0-alpha.1",

        needs_build = true,

        -- non-default bundle patch path
        patch = "./bundle/cordis.patch.yml",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
