package = {
    spec = "1",

    name = "dsh-security-audit",
    description = "DSH 本机安全审计插件：配置/插件来源/会话/网络暴露面，只读脱敏风险报告",
    repo = "https://github.com/omdsh-dev/dsh-security-audit",
    homepage = "https://github.com/omdsh-dev/dsh-security-audit",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-security-audit",
        source = "github",
        origin = "omdsh-dev/dsh-security-audit",

        versions = {
            ["0.0.1"] = { ref = "3ce07b74228f067957a5b8c5e6b84c56e285428f" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
