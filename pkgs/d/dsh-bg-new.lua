package = {
    spec = "1",

    name = "dsh-bg-new",
    description = "DSH 网页界面换背景：侧栏「壁纸」按钮弹出右侧抽屉，支持系统预设/纯色/渐变/图片/视频，滚轮+拖动小图同时管缩放与定位，毛玻璃质感，本地媒体伺服不走云端。DSH web background & wallpaper plugin with drawer UI, glassmorphism and local media serving.",
    repo = "https://github.com/sz1698/dsh-bg-new",
    homepage = "https://github.com/sz1698/dsh-bg-new",
    licenses = {"MIT"},
    authors = {"sz1698"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-bg-new",

        versions = {
            ["0.7.0"] = { commit = "b3c098e2cb709cffcc65fcaccb3350d91fe772b0" },
        },
        latest = "0.7.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
