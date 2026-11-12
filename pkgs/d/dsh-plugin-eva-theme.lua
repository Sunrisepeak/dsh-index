package = {
    spec = "1",

    name = "dsh-plugin-eva-theme",
    description = "DSH / DeepSeek Harness EVA 主题插件：明日香暗色、绫波丽亮色，含驾驶员选择、启动语音、时钟与音乐播放器",
    repo = "https://github.com/seaison/dsh-plugin-eva-theme",
    homepage = "https://github.com/seaison/dsh-plugin-eva-theme",
    authors = {"seaison"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-eva-theme",

        versions = {
            ["0.51.2"] = { commit = "f8b96381ceda724c58e79ec375e0dfe08d244349" },
        },
        latest = "0.51.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
