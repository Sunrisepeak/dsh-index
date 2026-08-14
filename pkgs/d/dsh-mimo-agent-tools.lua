package = {
    spec = "1",

    name = "dsh-mimo-agent-tools",
    description = "Xiaomi MiMo search + multimodal tools for DeepSeek Harness agents: mimo_search/vision/audio/video/asr/tts",
    repo = "https://github.com/ch1bug/dsh-mimo-agent-tools",
    homepage = "https://github.com/ch1bug/dsh-mimo-agent-tools",
    licenses = {"MIT"},
    authors = {"ch1bug"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mimo-agent-tools",

        versions = {
            ["0.1.0"] = { commit = "6a6908f12c5fe824603a0bb9936482106232b79f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
