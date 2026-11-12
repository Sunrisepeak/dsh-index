package = {
    spec = "1",

    name = "dsh-cliworker-now",
    description = "DeepSeek Harness 多 CLI 智能体侧栏插件：独立对话、账号管理、角色预设与任务续聊",
    repo = "https://github.com/SuperWheel/dsh-cliworker-now",
    homepage = "https://github.com/SuperWheel/dsh-cliworker-now",
    licenses = {"MIT"},
    authors = {"SuperWheel"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-cliworker-now",

        versions = {
            ["0.8.7"] = { commit = "9e50d0453a555a248f231f4e92cf58c06d1a2b0e" },
        },
        latest = "0.8.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
