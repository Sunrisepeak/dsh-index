package = {
    spec = "1",

    name = "dsh-tool-hongtou",
    description = "DeepSeek Harness 红头公文插件：两阶段解耦流水线（LLM 结构化提纲 + 确定性 Word 2003 XML 版式渲染）生成标准红头公文",
    repo = "https://github.com/ExElectron/dsh-tool-hongtou",
    homepage = "https://github.com/ExElectron/dsh-tool-hongtou",
    licenses = {"MIT"},
    authors = {"ExElectron"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tool-hongtou",

        versions = {
            ["0.2.0"] = { commit = "0f34e4639442c45f3f54e076dd951cddba893017" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
