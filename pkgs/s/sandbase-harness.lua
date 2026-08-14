package = {
    spec = "1",

    name = "sandbase-harness",
    description = "Open-source CMA-compatible agent runtime for any model, with MCP tools, sandboxed sessions, audit, replay, and a local console. Includes a native DeepSeek Harness bundle over stdio MCP.",
    repo = "https://github.com/sandbaseai/sandbase-harness",
    homepage = "https://github.com/sandbaseai/sandbase-harness",
    authors = {"sandbaseai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "managed-agents",

        versions = {
            ["0.3.0"] = { commit = "63ff7c42de4b7a00140346413b93ce9a8a3afe41" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
