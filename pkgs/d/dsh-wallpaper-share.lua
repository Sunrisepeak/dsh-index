package = {
    spec = "1",

    name = "dsh-wallpaper-share",
    description = "一键同步壁纸引擎各类动态场景壁纸的插件，设置应用启动项。A \"wallpaper engine\" synchronization plugin mounted on the deepseek harness can synchronize static wallpapers",
    repo = "https://github.com/YRN-playmaker/dsh-wallpaper_share",
    homepage = "https://github.com/YRN-playmaker/dsh-wallpaper_share",
    licenses = {"GPL-3.0"},
    authors = {"YRN-playmaker"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-wallpaper_share",

        versions = {
            ["26.8.23"] = { commit = "095a1d04b5385cda3dafc38c9565196853830703" },
        },
        latest = "26.8.23",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
