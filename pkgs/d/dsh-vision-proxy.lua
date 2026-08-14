package = {
    spec = "1",

    name = "dsh-vision-proxy",
    description = "DeepSeek Harness 插件：DeepSeek 大脑 + 自动识图。附加图片自动经 Qwen VLM 转译成文字后交给 DeepSeek 作答",
    repo = "https://github.com/Flyvhidbwo/dsh-vision-proxy",
    homepage = "https://github.com/Flyvhidbwo/dsh-vision-proxy",
    licenses = {"MIT"},
    authors = {"Flyvhidbwo"},

    status = "dev",
    categories = {"dsh-plugin", "vision"},
    keywords = {"dsh", "ocr", "vision", "vlm"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-vision-proxy",

        versions = {
            ["0.1.3"] = { commit = "1ce3d215c73d9edc933626b3e3d1190f4df8ce18" },
            ["0.1.0"] = { commit = "bede819d322c327a707126d696cb942095e139a2" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-vision-proxy-0.1.0.tgz",
                sha256  = "c59e121a09ad7b3f028d1e348793962a6a78842eecb43368033c00005d340e4f",
                cn      = true,
            },
        },
    },
}
