package = {
    spec = "1",

    name = "dsh-session-manager",
    description = "DeepSeek Harness 会话管理设置面板：列出本机全部会话（运行中/空闲/已归档），支持继续会话、预览大纲、删除会话 | Session management settings section for dsh web: resume, outline, and delete any session",
    repo = "https://github.com/Vim0x3c/dsh-session-manager",
    homepage = "https://github.com/Vim0x3c/dsh-session-manager",
    licenses = {"MIT"},
    authors = {"Vim0x3c"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-manager",

        versions = {
            ["0.1.0"] = { commit = "53dee809eed7e1173f25d2b32a73bae1e18be598" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
