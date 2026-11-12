package = {
    spec = "1",

    name = "dsh-vision-opencode",
    description = "DSH plugin: Auto-convert images to text for pure-text LLMs (DeepSeek etc.) via any vision model. No need to switch your main model.",
    repo = "https://github.com/poiuyjie/dsh-vision-opencode",
    homepage = "https://github.com/poiuyjie/dsh-vision-opencode",
    licenses = {"MIT"},
    authors = {"poiuyjie"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-vision-opencode",

        versions = {
            ["0.3.4"] = { commit = "83102d35e38a7ae94f4d27e4bf725b6d7db5524e" },
        },
        latest = "0.3.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
