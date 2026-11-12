package = {
    spec = "1",

    name = "deepseek-harness-intelligent-ui",
    description = "Generative, interactive UI for DeepSeek Harness (DSH): declarative components and sandboxed live widgets streamed in chat.",
    repo = "https://github.com/dreamfarer-space/deepseek-harness-intelligent-ui",
    homepage = "https://github.com/dreamfarer-space/deepseek-harness-intelligent-ui",
    licenses = {"MIT"},
    authors = {"dreamfarer-space"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-intelligent-ui",

        versions = {
            ["0.2.15"] = { commit = "e0338ee7d0c7f31f4c3d26544909ca0edc4da07e" },
        },
        latest = "0.2.15",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
