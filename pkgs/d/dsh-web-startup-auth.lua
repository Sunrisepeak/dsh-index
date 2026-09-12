package = {
    spec = "1",

    name = "dsh-web-startup-auth",
    description = "DSH（DeepSeek Harness）远程 Web 启动 + 用户名/密码认证插件。 |  DeepSeek Harness Remote‑Web‑Launch Plugin with Username/Password Auth",
    repo = "https://github.com/GDWhisper/dsh-web-startup-auth",
    homepage = "https://github.com/GDWhisper/dsh-web-startup-auth",
    licenses = {"MIT"},
    authors = {"GDWhisper"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-startup-auth",

        versions = {
            ["0.1.2"] = { commit = "3ea0399d0c03ea0f0e0ee2073dc4a6bbd6b998c3" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
