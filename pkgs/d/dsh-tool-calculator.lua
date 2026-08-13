package = {
    spec = "1",

    name = "dsh-tool-calculator",
    description = "DSH 计算器工具插件：安全的数学表达式求值器，零依赖递归下降解析器",
    repo = "https://github.com/omdsh-dev/dsh-tool-calculator",
    homepage = "https://github.com/omdsh-dev/dsh-tool-calculator",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "sandbox"},
    keywords = {"dsh", "calculator", "expression-evaluator", "math"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-calculator",
        source = "github",
        origin = "omdsh-dev/dsh-tool-calculator",

        versions = {
            ["0.0.1"] = { ref = "ec533420e13306ae0cc8ed45906e4838050f1516" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
