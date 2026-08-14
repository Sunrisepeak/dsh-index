package = {
    spec = "1",

    name = "dsh-voice-input",
    description = "Voice-to-text input plugin for the DeepSeek Harness Web UI",
    repo = "https://github.com/forrestahha/dsh-voice-input",
    homepage = "https://github.com/forrestahha/dsh-voice-input",
    licenses = {"MIT"},
    authors = {"forrestahha"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-voice-input",

        versions = {
            ["0.1.1"] = { commit = "76c1c5acbb9cc51584e14199d4fc588a4699f965" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
