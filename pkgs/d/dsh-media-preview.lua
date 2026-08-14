package = {
    spec = "1",

    name = "dsh-media-preview",
    description = "Audio/video preview viewer for dsh-better-sidebar: native playback with Range-seeking streaming route",
    repo = "https://github.com/tsonglew/dsh-media-preview",
    homepage = "https://github.com/tsonglew/dsh-media-preview",
    licenses = {"MIT"},
    authors = {"tsonglew"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-media-preview",

        versions = {
            ["0.1.0"] = { commit = "ef9685c9b4f0f4e3c810ebf520d3f67d099b1e39" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
