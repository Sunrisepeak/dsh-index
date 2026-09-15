package = {
    spec = "1",

    name = "dsh-image-gen",
    description = "Installable multi-provider image generation bundle for DeepSeek Harness (Google Gemini, OpenAI, Volcengine Seedream)",
    repo = "https://github.com/shanliuling/dsh-image-gen",
    homepage = "https://github.com/shanliuling/dsh-image-gen",
    licenses = {"MIT"},
    authors = {"shanliuling"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-image-gen",

        versions = {
            ["0.1.1"] = { commit = "42d53b0ee26f4b4c8eeabbd4ba89662a1b3179f5" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
