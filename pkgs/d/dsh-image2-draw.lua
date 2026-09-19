package = {
    spec = "1",

    name = "dsh-image2-draw",
    description = "DeepSeek Harness Image2 生图插件，通过第三方 OpenAI Images 兼容接口调用 gpt-image-2，只需配置 baseURL 和 API Key。 | Image2 generation plugin for DeepSeek Harness via third-party OpenAI Images-compatible APIs.",
    repo = "https://github.com/JuneLearn/dsh-image2-draw",
    homepage = "https://github.com/JuneLearn/dsh-image2-draw",
    licenses = {"MIT"},
    authors = {"JuneLearn"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-image2-draw",

        versions = {
            ["0.1.0"] = { commit = "78972d05d604a73fed32323cd3ec3e5506e2fdfe" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
