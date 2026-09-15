package = {
    spec = "1",

    name = "dsh-plugin-tts",
    description = "Edge TTS voice plugin for DeepSeek Harness: read assistant replies aloud, auto-read toggle, voice settings panel (free, no API key)",
    repo = "https://github.com/1624318455/dsh-plugin-tts",
    homepage = "https://github.com/1624318455/dsh-plugin-tts",
    licenses = {"MIT"},
    authors = {"1624318455"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-plugin-tts",

        versions = {
            ["0.3.0"] = { commit = "136ed935bcaa741e623164dd7f9328f1bfce5481" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
