package = {
    spec = "1",

    name = "dsh-tool-markdown",
    description = "DSH Markdown 工具插件：HTML↔Markdown 转换、GFM 表格规范化、目录生成，零依赖轻量解析器，注册 markdown 工具",
    repo = "https://github.com/omdsh-dev/dsh-tool-markdown",
    homepage = "https://github.com/omdsh-dev/dsh-tool-markdown",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "html-conversion", "markdown"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-markdown",

        versions = {
            ["0.0.1"] = { commit = "13ada4a0673c0c88520e85ad213c759c57ea77d5" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
