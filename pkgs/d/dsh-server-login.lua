package = {
    spec = "1",

    name = "dsh-server-login",
    description = "面向公网的多租户 DSH 托管平台 —— 部署到一台公网服务器后，多个用户注册并经管理员审核，各自获得一套相互隔离的 deepseek-harness（DSH）环境，随时通过域名安全访问。",
    repo = "https://github.com/pointer-a/dsh-server-login",
    homepage = "https://github.com/pointer-a/dsh-server-login",
    licenses = {"MIT"},
    authors = {"pointer-a"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-server-login",

        versions = {
            ["0.1.0"] = { commit = "04bc832ee8ffcff56dc551dc12845da4a4f2550d" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
