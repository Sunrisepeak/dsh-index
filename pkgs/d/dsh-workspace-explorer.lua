package = {
    spec = "1",

    name = "dsh-workspace-explorer",
    description = "DeepSeek Harness 工作区文件资源管理器:右侧目录树面板,点击/拖拽文件引用进输入框,UI 对齐 DSH 原生风格 | Workspace file explorer plugin for DeepSeek Harness: right-side file tree panel, click or drag file references into the composer, native DSH look",
    repo = "https://github.com/Jiyr0119/dsh-workspace-explorer",
    homepage = "https://github.com/Jiyr0119/dsh-workspace-explorer",
    licenses = {"MIT"},
    authors = {"Jiyr0119"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@jiyr0119/dsh-workspace-explorer",

        versions = {
            ["0.6.3"] = { commit = "2061ec57661dff1d5969d55c01ea00aea3e34610" },
        },
        latest = "0.6.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
