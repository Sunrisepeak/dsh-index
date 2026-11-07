package = {
    spec = "1",

    name = "dsh-voice-prompt-enhancer",
    description = "DeepSeek Harness (DSH) 插件：✨ 提示词一键增强 + 💬 语音输入增强",
    repo = "https://github.com/Fishsb/dsh-voice-prompt-enhancer",
    homepage = "https://github.com/Fishsb/dsh-voice-prompt-enhancer",
    licenses = {"Apache-2.0"},
    authors = {"Fishsb"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-voice-prompt-enhancer",

        versions = {
            ["3.5.1"] = { commit = "034ee1ffa372e304959db642cecd107a8b7f89d3" },
        },
        latest = "3.5.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
