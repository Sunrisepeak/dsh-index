package = {
    spec = "1",

    name = "dsh-reasoning-settings",
    description = "让 DeepSeek Harness 的第三方 API 支持低、中、高等推理强度，并可为每次子 Agent 调用选择模型｜Add Low, Medium, High, and other reasoning levels to third-party APIs, with model selection for each subagent call",
    repo = "https://github.com/JuneLearn/dsh-reasoning-settings",
    homepage = "https://github.com/JuneLearn/dsh-reasoning-settings",
    licenses = {"MIT"},
    authors = {"JuneLearn"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-reasoning-settings",

        versions = {
            ["0.3.0"] = { commit = "5768999dbbbb5088fd27f89c85970fe2f7b2c5c6" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
