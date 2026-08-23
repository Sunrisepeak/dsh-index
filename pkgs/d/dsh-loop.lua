package = {
    spec = "1",

    name = "dsh-loop",
    description = "DSH 插件：定时循环（/loop 命令 + loop 工具 + 活动状态条）。官方 bundle 插件，dsh plugin --profile web add 安装",
    repo = "https://github.com/vlln/dsh-loop",
    homepage = "https://github.com/vlln/dsh-loop",
    licenses = {"MIT"},
    authors = {"vlln"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "workflow"},
    keywords = {"dsh", "ui"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-loop",

        versions = {
            ["0.3.1"] = { commit = "7d509f0ffb2bca5769854de3cc4f35d0fc6121d9" },
            ["0.3.0"] = { commit = "e7159369169526e92f75727b35d83029568b3a21" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.3.0"] = {
                tarball = "dsh-loop-0.3.0.tgz",
                sha256  = "1d63b2de85289343bb2607f17512d2133110d3d30cf773f714f9db1b6a9a8b35",
                cn      = true,
            },
        },
    },
}
