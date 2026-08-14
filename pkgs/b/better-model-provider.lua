package = {
    spec = "1",

    name = "better-model-provider",
    description = "Per-model capability declaration for DeepSeek Harness: reasoning-effort levels (wire spellings) + request modalities (vision) for OpenAI-compatible providers. Settings section, zero runtime harness deps, no YAML.",
    repo = "https://github.com/sanshanya/better-model-provider",
    homepage = "https://github.com/sanshanya/better-model-provider",
    licenses = {"MIT"},
    authors = {"sanshanya"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "better-model-provider",

        versions = {
            ["0.0.1"] = { commit = "3d820441d71d0d50cdb90eb69961a9268e5e3d42" },
        },
        latest = "0.0.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
