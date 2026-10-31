package = {
    spec = "1",

    name = "dsh-voice-ai-girlfriend-plugin",
    description = "dsh-voice-ai-girlfriend-plugin",
    repo = "https://github.com/beiyege-01/dsh-voice-ai-girlfriend-plugin",
    homepage = "https://github.com/beiyege-01/dsh-voice-ai-girlfriend-plugin",
    authors = {"beiyege-01"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@beiyege-01/dsh-voice-ai-girlfriend",

        versions = {
            ["0.3.0"] = { commit = "b0ac0fe37abd7a9f1e486d24c9bd1c70d2cd3728" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
