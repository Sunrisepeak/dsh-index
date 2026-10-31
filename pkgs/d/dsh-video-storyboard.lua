package = {
    spec = "1",

    name = "dsh-video-storyboard",
    description = "Scene-aware storyboard for DeepSeek Harness: 9-16 numbered cells with timestamps + transcript + an audio envelope, packed into ONE image (384 tokens). Two tools: video_storyboard and video_zoom.",
    repo = "https://github.com/SAOS-3624/dsh-video-storyboard",
    homepage = "https://github.com/SAOS-3624/dsh-video-storyboard",
    licenses = {"MIT"},
    authors = {"SAOS-3624"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-video-storyboard",

        versions = {
            ["0.4.0"] = { commit = "c4bddd66768f65d4a17907e8da136e613fdaee9f" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
