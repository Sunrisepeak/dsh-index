package = {
    spec = "1",

    name = "dsh-session-health",
    description = "DSH 会话健康检查插件：多帧 zstd 会话文件的帧级扫描诊断（torn/损坏/空会话检测），零依赖只读，注册 session_health 工具",
    repo = "https://github.com/omdsh-dev/dsh-session-health",
    homepage = "https://github.com/omdsh-dev/dsh-session-health",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "session"},
    keywords = {"dsh", "diagnostics", "health-check", "zstd"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-session-health",

        versions = {
            ["0.0.1"] = { commit = "e63fe6ca874bef46eacba5e3e4cf05eef86cfb68" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
