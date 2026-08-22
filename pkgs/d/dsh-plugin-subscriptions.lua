package = {
    spec = "1",

    name = "dsh-plugin-subscriptions",
    description = "Use ChatGPT (Codex), Claude, and Grok (X Premium) subscriptions as DeepSeek Harness LLM providers — OAuth login in the web UI, no API keys",
    repo = "https://github.com/V1ki/dsh-plugin-subscriptions",
    homepage = "https://github.com/V1ki/dsh-plugin-subscriptions",
    licenses = {"MIT"},
    authors = {"V1ki"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-subscriptions",

        versions = {
            ["0.3.0"] = { commit = "6447924c256b0ecbf3437246bfbe18dae19e96dc" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
