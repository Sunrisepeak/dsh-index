package = {
    spec = "1",

    name = "dsh-startup-secret",
    description = "DeepSeek Harness 启动动画插件（二次创作版）：暗色赛博风格开机动画，徽章标识 + 赛博电子风人物立绘 + 访问密码功能",
    repo = "https://github.com/huzhengcai471-crypto/dsh-startup-secret",
    homepage = "https://github.com/huzhengcai471-crypto/dsh-startup-secret",
    licenses = {"MIT"},
    authors = {"huzhengcai471-crypto"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-startup-secret",

        versions = {
            ["1.5.2"] = { commit = "c03017be5fed09c56b67f07e93beb109fdfa402a" },
        },
        latest = "1.5.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
