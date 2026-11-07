package = {
    spec = "1",

    name = "dsh-dfy",
    description = "DeepSeek Harness (DSH) all-in-one plugin: balance whale widget, 106-clip transparent desktop pet, QQ message card via SnowLuma, Bilibili interaction, local redacted memory. 一个 DSH 插件：小鲸鱼余额挂件 + 桌宠 + QQ 消息卡 + B站 + 双向脱敏记忆；数据只存本机。",
    repo = "https://github.com/louke6572/dsh-Dfy",
    homepage = "https://github.com/louke6572/dsh-Dfy",
    authors = {"louke6572"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-dfy",

        versions = {
            ["0.7.3"] = { commit = "df08522f54aef92182524488ff2cbbeedde780fa" },
        },
        latest = "0.7.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
