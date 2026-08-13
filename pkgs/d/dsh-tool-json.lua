package = {
    spec = "1",

    name = "dsh-tool-json",
    description = "DSH JSON 查询工具插件：JMESPath 子集查询，零依赖递归下降解析器",
    repo = "https://github.com/omdsh-dev/dsh-tool-json",
    homepage = "https://github.com/omdsh-dev/dsh-tool-json",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "jmespath", "json", "query"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-json",
        source = "github",
        origin = "omdsh-dev/dsh-tool-json",

        versions = {
            ["0.0.1"] = { ref = "527d4decd43953b8b19628e8db5d0e0a8d726b01" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
