package = {
    spec = "1",

    name = "dsh-webui-market-plugin",
    description = "dsh Web GUI 社区插件市场：浏览 awesome-dsh-plugin.com 插件目录，一键安装/卸载到 profile。Community plugin market for the DeepSeek Harness (dsh) web GUI: browse, install and uninstall plugins into a profile.",
    repo = "https://github.com/Sanqi-normal/dsh-webui-market-plugin",
    homepage = "https://github.com/Sanqi-normal/dsh-webui-market-plugin",
    licenses = {"MIT"},
    authors = {"Sanqi-normal"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@sanqi-normal/dsh-webui-market-plugin",

        versions = {
            ["0.5.5"] = { commit = "44cd1ababaeeda11519042ab876c598f5961774d" },
            ["0.5.2"] = { commit = "0a09c21bae41318bc2fed51c274b2496b22988d5" },
            ["0.1.2"] = { commit = "c2b6f2988a27daa79e56d02d5a91ed9ab49d796e" },
        },
        latest = "0.5.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
