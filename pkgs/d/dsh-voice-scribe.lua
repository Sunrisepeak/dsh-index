package = {
    spec = "1",

    name = "dsh-voice-scribe",
    description = "DSH voice input plugin: tap Alt to talk, get text in composer. Web Speech default (zero config), optional OpenAI-compatible ASR, polish via DSH LLM.",
    repo = "https://github.com/PensiveFei/dsh-voice-scribe",
    homepage = "https://github.com/PensiveFei/dsh-voice-scribe",
    licenses = {"MIT"},
    authors = {"PensiveFei"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-voice-scribe",

        versions = {
            ["0.4.0"] = { commit = "9fd8efde0a4ca41eea78e509cafc002c3bf169c2" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
