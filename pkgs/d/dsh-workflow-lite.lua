package = {
    spec = "1",

    name = "dsh-workflow-lite",
    description = "DeepSeek Harness 的软工作流插件：在画布上设计流程，编译成计划提示词，由模型按计划执行；运行状态由模型自己记，没有执行引擎",
    repo = "https://github.com/xiaoso456/dsh-workflow-lite",
    homepage = "https://github.com/xiaoso456/dsh-workflow-lite",
    authors = {"xiaoso456"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xiaoso/dsh-workflow-lite",

        versions = {
            ["0.9.0"] = { commit = "df8f5d0950ec7b839284c22cb31bf02420a1fa2b" },
        },
        latest = "0.9.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
