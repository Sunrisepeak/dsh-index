package = {
    spec = "1",

    name = "dsh-zotero-wiki",
    description = "DeepSeekHarness × Zotero 插件：自动同步文献库，MinerU 解析 PDF，DeepSeek 全文阅读生成结构化笔记，编译成可检索的 Obsidian LLM Wiki。",
    repo = "https://github.com/Wechsels/dsh-zotero-wiki",
    homepage = "https://github.com/Wechsels/dsh-zotero-wiki",
    licenses = {"MIT"},
    authors = {"Wechsels"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-zotero-wiki",

        versions = {
            ["0.1.0"] = { commit = "a6cd24416faa41770b6f21ec5acefffcb8733162" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
