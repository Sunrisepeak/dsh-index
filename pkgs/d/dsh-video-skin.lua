package = {
    spec = "1",

    name = "dsh-video-skin",
    description = "DSH 视频皮肤：聊天背景 + 有声开机动画 + 界面内透明度调节",
    repo = "https://github.com/Something11235/dsh-video-skin",
    homepage = "https://github.com/Something11235/dsh-video-skin",
    licenses = {"MIT"},
    authors = {"Something11235"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-video-skin",

        versions = {
            ["0.1.1"] = { commit = "f5b69ee2d8aaa16088990ac59460d52388295735" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
