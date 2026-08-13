package = {
    spec = "1",

    name = "dsh-navbar",
    description = "DSH 插件：对话节点导航条（右缘节点串快速跳转 user 消息）。官方 bundle 插件，dsh plugin --profile web add 安装",
    repo = "https://github.com/vlln/dsh-navbar",
    homepage = "https://github.com/vlln/dsh-navbar",
    licenses = {"MIT"},
    authors = {"vlln"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "session"},
    keywords = {"dsh", "ui"},

    dsh = {
        bundle_name = "@dsh-external/dsh-navbar",
        source = "github",
        origin = "vlln/dsh-navbar",

        versions = {
            ["0.3.0"] = { ref = "6e23640bd60c0157043ae5c29a6d80034287b41b" },
        },
        latest = "0.3.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
