package = {
    spec = "1",

    name = "opencode2dsh",
    description = "DSH plugin — free OpenCode Zen models for DeepSeek Harness (DSH). Free LLM API, no API key needed. 在 DSH 中使用 OpenCode Zen 免费模型，无需 API key",
    repo = "https://github.com/FishBottle7/opencode2dsh",
    homepage = "https://github.com/FishBottle7/opencode2dsh",
    licenses = {"MIT"},
    authors = {"FishBottle7"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "opencode2dsh",

        versions = {
            ["0.0.0"] = { commit = "53d3e3c1a00789c3cc9c7beb0dfe5f0ef5f179fc" },
        },
        latest = "0.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
