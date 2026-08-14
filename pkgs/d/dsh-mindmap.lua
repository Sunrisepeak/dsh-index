package = {
    spec = "1",

    name = "dsh-mindmap",
    description = "DSH 思维导图模式插件：课件(PPT/PDF/Word)+电子书 → 打印级复习思维导图 HTML（A3 横向、每主干一页、大括号式横向、宋体、右栏笔记区、封面总览 + 交互式测试题）",
    repo = "https://github.com/chenw2759-wq/dsh-mindmap",
    homepage = "https://github.com/chenw2759-wq/dsh-mindmap",
    authors = {"chenw2759-wq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-mindmap",

        versions = {
            ["0.1.0"] = { commit = "41d2d8eb54033c4576e9e4108479f643eecfa044" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
