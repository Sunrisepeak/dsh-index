package = {
    spec = "1",

    name = "dsh-workspace-explorer",
    description = "VS Code 风格双栏资源管理器。左侧多工作区文件树：语言着色 SVG 图标、行内重命名、新建文件/文件夹；右侧编辑器可拖拽缩放，行号 + 状态栏，语法高亮（函数/关键字/注释/字符串分色，支持 10 种语言）",
    repo = "https://github.com/3911ee/dsh-workspace-explorer",
    homepage = "https://github.com/3911ee/dsh-workspace-explorer",
    licenses = {"MIT"},
    authors = {"3911ee"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-workspace-explorer",

        versions = {
            ["0.1.0"] = { commit = "82125147b6ef80cf704eeb2f896a6e659073a542" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
