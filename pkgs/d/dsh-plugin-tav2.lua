package = {
    spec = "1",

    name = "dsh-plugin-tav2",
    description = "DeepSeek Harness 插件 —— 对话式游戏本地化：跟 AI 助手说说话，完成游戏翻译全流程。引擎适配器架构，首发支持 Ren'Py。",
    repo = "https://github.com/Drhushi/dsh-plugin-tav2",
    homepage = "https://github.com/Drhushi/dsh-plugin-tav2",
    licenses = {"MIT"},
    authors = {"Drhushi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-tav2",

        versions = {
            ["0.2.2"] = { commit = "4580b6341ca25bdb1953ce444aff9dd7165dc8b5" },
        },
        latest = "0.2.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
