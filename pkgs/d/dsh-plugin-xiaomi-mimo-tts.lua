package = {
    spec = "1",

    name = "dsh-plugin-xiaomi-mimo-tts",
    description = "给DSH接入免费的 Xiaomi MiMo TTS API，支持使用预置/自定义/浏览器内置声音朗读正文",
    repo = "https://github.com/ppy-web/dsh-plugin-xiaomi-mimo-tts",
    homepage = "https://github.com/ppy-web/dsh-plugin-xiaomi-mimo-tts",
    licenses = {"MIT"},
    authors = {"ppy-web"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-xiaomi-tts",

        versions = {
            ["3.0.9"] = { commit = "2483177eb3899a04a1a85ad89c0f3e0c4d5fe8f6" },
        },
        latest = "3.0.9",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
