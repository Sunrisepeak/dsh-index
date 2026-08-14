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
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-navbar",

        versions = {
            ["0.3.0"] = { commit = "6e23640bd60c0157043ae5c29a6d80034287b41b" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.3.0"] = {
                tarball = "dsh-navbar-0.3.0.tgz",
                sha256  = "86341437224bf6166eb4495056f605bcee22d8c531b17898898336cf974a9ed6",
                cn      = true,
            },
        },
    },
}
