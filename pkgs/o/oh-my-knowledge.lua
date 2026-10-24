package = {
    spec = "1",

    name = "oh-my-knowledge",
    description = "OMK — Evidence-backed evaluation and observability for prompts, RAG, skills, agents, and workflows. Native Codex, Claude Code, and DeepSeek Harness support.",
    repo = "https://github.com/lizhiyao/oh-my-knowledge",
    homepage = "https://github.com/lizhiyao/oh-my-knowledge",
    licenses = {"MIT"},
    authors = {"lizhiyao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "oh-my-knowledge",

        versions = {
            ["0.54.0"] = { commit = "a5603016f7e9aaa6ecd0a1261dfde72c5efba992" },
        },
        latest = "0.54.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
