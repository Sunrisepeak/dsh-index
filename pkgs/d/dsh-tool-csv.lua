package = {
    spec = "1",

    name = "dsh-tool-csv",
    description = "DSH CSV 数据工具插件：解析/查询/统计/转换 CSV 文本（RFC 4180），零依赖状态机解析器，注册 csv 工具",
    repo = "https://github.com/omdsh-dev/dsh-tool-csv",
    homepage = "https://github.com/omdsh-dev/dsh-tool-csv",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "csv", "data-parsing", "rfc4180"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-csv",
        source = "github",
        origin = "omdsh-dev/dsh-tool-csv",

        versions = {
            ["0.0.1"] = { ref = "db0a5a14403a8fb6ad9345d2163447a645e32279" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
