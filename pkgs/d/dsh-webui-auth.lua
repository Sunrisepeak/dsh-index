package = {
    spec = "1",

    name = "dsh-webui-auth",
    description = "WebUI 身份认证：HTTP/传输层强制登录（资源、插件 bundle、/api、WebSocket 四层防护），服务端会话 + HttpOnly Cookie。",
    repo = "https://github.com/Yuuz12/dsh-webui-auth",
    homepage = "https://github.com/Yuuz12/dsh-webui-auth",
    licenses = {"MIT"},
    authors = {"Yuuz12"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-webui-auth",

        versions = {
            ["0.2.3"] = { commit = "6adeb61e8db3c009b526dc3b9c5e73f3c69396bb" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
