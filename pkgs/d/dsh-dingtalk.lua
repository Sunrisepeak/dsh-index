package = {
    spec = "1",

    name = "dsh-dingtalk",
    description = "Official DingTalk connector for DeepSeek Harness",
    repo = "https://github.com/DingTalk-Real-AI/dsh-dingtalk",
    homepage = "https://github.com/DingTalk-Real-AI/dsh-dingtalk",
    licenses = {"MIT"},
    authors = {"DingTalk-Real-AI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dingtalk-real-ai/dsh-dingtalk",

        versions = {
            ["0.0.0-development"] = { commit = "5f6607460e34d813f1c2042ed0339d9bbfd69262" },
        },
        latest = "0.0.0-development",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
