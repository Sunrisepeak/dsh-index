package = {
    spec = "1",

    name = "dsh-fail-logger",
    description = "DeepSeek Harness（DSH）插件：自动记录所有执行模式（原生工具 / PTC run_code / 代码内嵌工具调用）的工具失败错因，去重、计数、确定性排序后沉淀进 skill 的机器维护实录区段——让 Agent 越用越少错。",
    repo = "https://github.com/Areium/dsh-fail-logger",
    homepage = "https://github.com/Areium/dsh-fail-logger",
    licenses = {"MIT"},
    authors = {"Areium"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-fail-logger",

        versions = {
            ["0.5.1"] = { commit = "854791d33511a1449b4d80a1b152041e2f0cc386" },
        },
        latest = "0.5.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
