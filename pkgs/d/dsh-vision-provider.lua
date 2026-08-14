package = {
    spec = "1",

    name = "dsh-vision-provider",
    description = "Config-only DeepSeek Harness bundle for OpenAI-compatible vision models.",
    repo = "https://github.com/libinyam/dsh-vision-provider",
    homepage = "https://github.com/libinyam/dsh-vision-provider",
    licenses = {"MIT"},
    authors = {"libinyam"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-vision-provider",

        versions = {
            ["0.3.3"] = { commit = "719e6a337e0147ab73d84527cd52880759f0f828" },
        },
        latest = "0.3.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
