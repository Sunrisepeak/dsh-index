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
        bundle_name = "dsh-vision-proxy",
        source = "github",
        origin = "Flyvhidbwo/dsh-vision-proxy",

        versions = {
            ["0.1.0"] = { ref = "bede819d322c327a707126d696cb942095e139a2" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
