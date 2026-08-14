package = {
    spec = "1",

    name = "dsh-agent-message",
    description = "DeepSeek Harness 跨会话 Agent 通信插件｜Cross-session agent-to-agent messaging with offline delivery, receipts and session navigation for DeepSeek Harness.",
    repo = "https://github.com/GengDaPeng/dsh-agent-message",
    homepage = "https://github.com/GengDaPeng/dsh-agent-message",
    licenses = {"MIT"},
    authors = {"GengDaPeng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agent-message",

        versions = {
            ["1.4.0"] = { commit = "197dd677939898f968793de5e936205e012736fc" },
        },
        latest = "1.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
