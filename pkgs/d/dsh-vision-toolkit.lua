package = {
    spec = "1",

    name = "dsh-vision-toolkit",
    description = "让纯文本模型更好地做视觉任务的DeepSeek Harness插件：带意图的图片问答、长截图 OCR、UI 还原等｜DeepSeek Harness-native integration for agent-vision",
    repo = "https://github.com/Anionex/dsh-vision-toolkit",
    homepage = "https://github.com/Anionex/dsh-vision-toolkit",
    licenses = {"MIT"},
    authors = {"Anionex"},

    status = "dev",
    categories = {"dsh-plugin", "vision", "skills"},
    keywords = {"dsh", "agent-skills", "agent-vision-toolkit", "computer-vision", "gui-automation", "ocr", "python", "screenshot-testing", "text-only-llm"},

    dsh = {
        bundle_name = "@dsh-external/dsh-vision-toolkit",

        versions = {
            ["0.1.2"] = { commit = "091d8631eee0228df89c623598d3537b61618cb3" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
