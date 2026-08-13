package = {
    spec = "1",

    name = "dsh-context-doctor",
    description = "DSH 上下文注入审计插件：统计 AGENTS.md 指令链/技能目录/工具 schema 的 token 成本，检测重复与冲突；Web UI 圆环面板 + context_audit 工具。Context Doctor",
    repo = "https://github.com/Zhenyu98/dsh-context-doctor",
    homepage = "https://github.com/Zhenyu98/dsh-context-doctor",
    licenses = {"BSD-3-Clause"},
    authors = {"Zhenyu98"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "memory"},
    keywords = {"dsh", "context", "tool", "ui"},

    dsh = {
        bundle_name = "dsh-context-doctor",
        source = "github",
        origin = "Zhenyu98/dsh-context-doctor",

        versions = {
            ["0.2.0"] = { ref = "4a91502c106f7fed86981421c740566abf309977" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
