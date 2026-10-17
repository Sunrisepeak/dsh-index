package = {
    spec = "1",

    name = "deepseek-harness-video-director",
    description = "🎬AI-Powered Director: MiniMax-H3 Video Generation Plugin Directed by DeepSeek-Harness. 🤖More than Prompting. 🪄Canvas UI.",
    repo = "https://github.com/chiphoton/DeepSeek-Harness-Video-Director",
    homepage = "https://github.com/chiphoton/DeepSeek-Harness-Video-Director",
    licenses = {"MIT"},
    authors = {"chiphoton"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-video-director",

        versions = {
            ["0.1.2"] = { commit = "fb042c57e8aff4236b351c54ba8fedd1aba6a8e3" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
