package = {
    spec = "1",

    name = "ego-browser",
    description = "DSH（DeepSeek Harness）插件：把 ego-lite 浏览器（给 AI Agent 用的 Chromium）接入 HARNESS——13 个结构化 ego_* 工具（文本语义快照、语义定位点击、表单填充、截图、CDP 控制、任务空间隔离），内置 ego 运行时，Linux + Chrome 开箱即用，无需克隆官方仓库或手动构建。",
    repo = "https://github.com/Fisfzy/ego-browser",
    homepage = "https://github.com/Fisfzy/ego-browser",
    authors = {"Fisfzy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/ego-browser",

        versions = {
            ["0.7.0"] = { commit = "a759af2cf4405e957b8f01a59c502dcfdacf41d0" },
        },
        latest = "0.7.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
