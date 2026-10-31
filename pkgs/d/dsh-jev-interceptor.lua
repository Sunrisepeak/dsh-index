package = {
    spec = "1",

    name = "dsh-jev-interceptor",
    description = "⚡ Millisecond System-1 judgement for every tool call in DeepSeek Harness — Jev-powered risk classification & evidence-gated auto-approval. Fail-closed by construction. dsh 生态第一个 System-1 决策插件",
    repo = "https://github.com/AskTheWay/dsh-jev-interceptor",
    homepage = "https://github.com/AskTheWay/dsh-jev-interceptor",
    licenses = {"MIT"},
    authors = {"AskTheWay"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-jev-interceptor",

        versions = {
            ["0.2.4"] = { commit = "ee8f4af375d93e4c0391c7145f2731441a94c8d4" },
        },
        latest = "0.2.4",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
