package = {
    spec = "1",

    name = "dsh-win-notify",
    description = "DSH 插件：代理任务完成时弹出带声音的 Windows Toast 通知，点击通知即可直接切回并前台显示 DSH 标签页",
    repo = "https://github.com/MuziIsabel/dsh-win-notify",
    homepage = "https://github.com/MuziIsabel/dsh-win-notify",
    licenses = {"MIT"},
    authors = {"MuziIsabel"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-win-notify",

        versions = {
            ["1.6.0"] = { commit = "8f2ec74406b4cd5f59b7d98f2ed949641326ce3c" },
        },
        latest = "1.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
