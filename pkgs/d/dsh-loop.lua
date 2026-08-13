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
        bundle_name = "@dsh-external/dsh-loop",
        source = "github",
        origin = "vlln/dsh-loop",

        versions = {
            ["0.3.0"] = { ref = "e7159369169526e92f75727b35d83029568b3a21" },
        },
        latest = "0.3.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
