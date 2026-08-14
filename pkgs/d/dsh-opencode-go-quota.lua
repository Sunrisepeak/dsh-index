package = {
    spec = "1",

    name = "dsh-opencode-go-quota",
    description = "DSH 插件：OpenCode Go 额度圆环 —— 输入框模型选择器左侧的进度圆环，点击切换 5小时/每周/每月用量（OpenCode Go quota ring for DeepSeek Harness Web）",
    repo = "https://github.com/GLFzr/dsh-opencode-go-quota",
    homepage = "https://github.com/GLFzr/dsh-opencode-go-quota",
    licenses = {"MIT"},
    authors = {"GLFzr"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-opencode-go-quota",

        versions = {
            ["0.2.0"] = { commit = "2098f1f4f9d5fd36b6142ee0cadf959d7a980852" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
