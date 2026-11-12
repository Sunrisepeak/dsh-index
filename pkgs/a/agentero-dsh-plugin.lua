package = {
    spec = "1",

    name = "agentero-dsh-plugin",
    description = "给 DeepSeek Harness 用的科研文献库插件：搜论文、带出处、审批入库、把笔记线索交给同会话其他插件。Academic research library for DSH — search, cite, approve imports, hand off notes.",
    repo = "https://github.com/poco-ai/agentero-dsh-plugin",
    homepage = "https://github.com/poco-ai/agentero-dsh-plugin",
    authors = {"poco-ai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@poco-ai/agentero-dsh",

        versions = {
            ["0.1.5"] = { commit = "3b995b9751350331210e70130330f7fb52955ef9" },
        },
        latest = "0.1.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
