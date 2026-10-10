package = {
    spec = "1",

    name = "dsh-visual-workflow",
    description = "专为 DeepSeek Harness Web GUI 打造的可视化多 Agent 工作流编排插件。公开测试版已上线！接下来会随着 DSH 的正式版上线一并发布正式版！",
    repo = "https://github.com/GZX2211/dsh-Visual-Workflow",
    homepage = "https://github.com/GZX2211/dsh-Visual-Workflow",
    licenses = {"MIT"},
    authors = {"GZX2211"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-visual-workflow",

        versions = {
            ["0.1.0"] = { commit = "b0bffe711475f1c84bbeff9d9e4b71f2a4d5c373" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
