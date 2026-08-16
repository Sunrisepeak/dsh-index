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
            ["0.3.2"] = { commit = "96707965931897d7f5489754700036dac8e4382e" },
            ["0.3.1"] = { commit = "04a915b830763a2eb16bceb95c61c0cde9571e44" },
            ["0.3.0"] = { commit = "5135a9b1f6a999f167600f30ec6e79d51174b895" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
