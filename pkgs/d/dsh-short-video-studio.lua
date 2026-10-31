package = {
    spec = "1",

    name = "dsh-short-video-studio",
    description = "基于deepseek harness和ComfyUI的AI视频创作工作台",
    repo = "https://github.com/fengyungithub/dsh-short-video-studio",
    homepage = "https://github.com/fengyungithub/dsh-short-video-studio",
    licenses = {"Apache-2.0"},
    authors = {"fengyungithub"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-short-video-studio",

        versions = {
            ["1.10.0"] = { commit = "7c0ef9a4af1e6a5c223605f0e5607be8c2d8b42c" },
        },
        latest = "1.10.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
