package = {
    spec = "1",

    name = "dsh-sandbox-escalation-fix",
    description = "Session-aware sandbox escalation compatibility plugin for DeepSeek Harness/DSH第三方模型会话沙箱升级兼容插件",
    repo = "https://github.com/JUSTMONIKA2022/dsh-sandbox-escalation-fix",
    homepage = "https://github.com/JUSTMONIKA2022/dsh-sandbox-escalation-fix",
    licenses = {"MIT"},
    authors = {"JUSTMONIKA2022"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-sandbox-escalation-fix",

        versions = {
            ["0.1.2"] = { commit = "50e1ffa8f7c91da43dd84783ac57e23b95ded584" },
        },
        latest = "0.1.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
