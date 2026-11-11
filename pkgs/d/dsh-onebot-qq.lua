package = {
    spec = "1",

    name = "dsh-onebot-qq",
    description = "DeepSeek Harness 的原生 QQ 机器人插件：微内核 + 子插件，Linux/Windows 通用。收消息、发图、生图、发表情，装完就能聊。此项目为个人因需求爱好，人力设计方案AI构建代码的插件，所以bug和不够合理的地方有许多，发出来仅为学习和分享",
    repo = "https://github.com/YUsaltyfish/dsh-onebot-qq",
    homepage = "https://github.com/YUsaltyfish/dsh-onebot-qq",
    licenses = {"MIT"},
    authors = {"YUsaltyfish"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-onebot-qq",

        versions = {
            ["0.1.1"] = { commit = "b24f14ae1b7de84ed8780721885e0b8227d01a3c" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
