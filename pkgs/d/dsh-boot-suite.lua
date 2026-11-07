package = {
    spec = "1",

    name = "dsh-boot-suite",
    description = "DeepSeek Harness 开机动画 + 聊天壁纸，一个插件：六幕冷启动动画（真声台词/可交互）+ 开场视频/底图/大字横幅。双击 安装.cmd 即可，出问题双击 卸载.cmd。",
    repo = "https://github.com/LeeRolling/dsh-boot-suite",
    homepage = "https://github.com/LeeRolling/dsh-boot-suite",
    licenses = {"MIT"},
    authors = {"LeeRolling"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-boot-suite",

        versions = {
            ["2.16.0"] = { commit = "34b892eae168abf14fc9623cb109d6806ffeacf2" },
        },
        latest = "2.16.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
