package = {
    spec = "1",

    name = "dsh-file-review-tab",
    description = "dsh-better-sidebar 侧边栏 Tab 版文件改动审查：行级红绿 diff + 撤销，chat 行深链（移植自 left0ver/dsh-file-review）/ Review agent file changes as a dsh-better-sidebar sidebar tab — line-level diffs + undo, ported from left0ver/dsh-file-review",
    repo = "https://github.com/Lzh3070/dsh-file-review-tab",
    homepage = "https://github.com/Lzh3070/dsh-file-review-tab",
    licenses = {"MIT"},
    authors = {"Lzh3070"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-file-review-tab",

        versions = {
            ["0.1.2"] = { commit = "4a114fb24d578174c550989537bb568debad6935" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
