package = {
    spec = "1",

    name = "dsh-layered-memory",
    description = "让 DeepSeek Harness 拥有跨会话长期记忆：AI 自动记住你是谁、你的项目和偏好，新会话直接带上背景，生活与工作记忆自动分开互不干扰，零配置无感运行 | Long-term memory for DeepSeek Harness: the AI remembers who you are, your projects and preferences across sessions, keeps personal and work memories separate, zero-config.",
    repo = "https://github.com/JunNanLYS/dsh-layered-memory",
    homepage = "https://github.com/JunNanLYS/dsh-layered-memory",
    licenses = {"MIT"},
    authors = {"JunNanLYS"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-layered-memory",

        versions = {
            ["0.11.0"] = { commit = "69028fbee43e9950fffecc578430909fc827527e" },
        },
        latest = "0.11.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
