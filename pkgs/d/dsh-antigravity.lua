package = {
    spec = "1",

    name = "dsh-antigravity",
    description = "为 DeepSeek Harness (DSH) 打造的 Google Antigravity 模型提供者插件/Google Antigravity LLM provider for DeepSeek Harness with native Web OAuth, real-time quota tracking, and dynamic reasoning effort routing.",
    repo = "https://github.com/LiZhenNet/dsh-antigravity",
    homepage = "https://github.com/LiZhenNet/dsh-antigravity",
    licenses = {"MIT"},
    authors = {"LiZhenNet"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-antigravity",

        versions = {
            ["0.0.4"] = { commit = "94957767c5e247d86cec8833fb1b67f659078af6" },
        },
        latest = "0.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
