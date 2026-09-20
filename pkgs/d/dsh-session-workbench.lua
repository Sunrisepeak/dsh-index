package = {
    spec = "1",

    name = "dsh-session-workbench",
    description = "Session Workbench for DeepSeek Harness: session-library full-text search + recall + conversation-view management (show/hide + reorder). 会话工作台：会话库（历史会话全文搜索与召回）+ 会话视图（标签栏显示/隐藏 + 拖拽排序）。",
    repo = "https://github.com/PolinniZhong/dsh-session-workbench",
    homepage = "https://github.com/PolinniZhong/dsh-session-workbench",
    licenses = {"MIT"},
    authors = {"PolinniZhong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-workbench",

        versions = {
            ["1.0.2"] = { commit = "9312b28922e65499eed54df86d9d26eda3000e4f" },
        },
        latest = "1.0.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
