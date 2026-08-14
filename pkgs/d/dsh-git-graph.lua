package = {
    spec = "1",

    name = "dsh-git-graph",
    description = "Embedded git repository graph visualizer for the DeepSeek Harness Web GUI | 嵌入式 Git 仓库图谱可视化插件（提交历史图 / 分支过滤 / 文件 diff / VSCode 式未提交改动）",
    repo = "https://github.com/1841220388zzzcccxxx-star/dsh-git-graph",
    homepage = "https://github.com/1841220388zzzcccxxx-star/dsh-git-graph",
    licenses = {"MIT"},
    authors = {"1841220388zzzcccxxx-star"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-git-graph",

        versions = {
            ["0.4.0"] = { commit = "66264042de90828e665dc248e26d501380560020" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
