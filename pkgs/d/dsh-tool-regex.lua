package = {
    spec = "1",

    name = "dsh-tool-regex",
    description = "DSH 正则工具插件：测试匹配/提取捕获组/安全替换/静态解释正则（不执行代码），零依赖，注册 regex 工具",
    repo = "https://github.com/omdsh-dev/dsh-tool-regex",
    homepage = "https://github.com/omdsh-dev/dsh-tool-regex",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "sandbox"},
    keywords = {"dsh", "redos-protection", "regex"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-regex",

        versions = {
            ["0.0.1"] = { commit = "ad5956cab06189cadee03f20bd8f3d30f110f471" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
