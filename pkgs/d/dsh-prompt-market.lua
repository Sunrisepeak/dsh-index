package = {
    spec = "1",

    name = "dsh-prompt-market",
    description = "DeepSeek Harness 提示词市场插件：对话框内一键浏览、搜索、收藏提示词，选中即写入输入框。零后端、免构建、数据只存本机。 | A prompt marketplace for DSH: browse, search and insert prompts straight into the composer.",
    repo = "https://github.com/yi-yezhiqiu/dsh-prompt-market",
    homepage = "https://github.com/yi-yezhiqiu/dsh-prompt-market",
    licenses = {"MIT"},
    authors = {"yi-yezhiqiu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-prompt-market",

        versions = {
            ["0.1.3"] = { commit = "cda11cb0dfc28cd0db344a2e90541b0563c79a1a" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
