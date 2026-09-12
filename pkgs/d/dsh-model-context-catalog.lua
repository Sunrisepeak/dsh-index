package = {
    spec = "1",

    name = "dsh-model-context-catalog",
    description = "DeepSeek Harness 插件：维护 llm-pi-ai 模型的准确上下文窗口，避免长会话被误判为上下文溢出。",
    repo = "https://github.com/HOWILLMAKEIT/dsh-model-context-catalog",
    homepage = "https://github.com/HOWILLMAKEIT/dsh-model-context-catalog",
    licenses = {"MIT"},
    authors = {"HOWILLMAKEIT"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-model-context-catalog",

        versions = {
            ["0.2.1"] = { commit = "ec03c1dc8689ca4f67ac42ad07f40df86b7bc936" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
