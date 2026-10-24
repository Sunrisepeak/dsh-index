package = {
    spec = "1",

    name = "dsh-llm-fallbacks",
    description = "An dsh plugin for role-based LLM retry&fallback strategy. 基于角色的模型重试备用策略插件",
    repo = "https://github.com/omdsh-dev/dsh-llm-fallbacks",
    homepage = "https://github.com/omdsh-dev/dsh-llm-fallbacks",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-llm-fallbacks",

        versions = {
            ["0.3.0"] = { commit = "478f7860c08943a88dc55a39ef558d226e9c7023" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
