package = {
    spec = "1",

    name = "dsh-file-explorer",
    description = "File explorer plugin for DeepSeek Harness: file tree, preview, markdown, syntax highlighting, in-panel editing, VS Code integration - DeepSeek Harness 全局文件资源管理器插件",
    repo = "https://github.com/joejojoking-cloud/dsh-file-explorer",
    homepage = "https://github.com/joejojoking-cloud/dsh-file-explorer",
    authors = {"joejojoking-cloud"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-file-explorer",

        versions = {
            ["0.1.1"] = { commit = "8f186671bd7e949b6a76f632fae4fb4522ee6248" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
