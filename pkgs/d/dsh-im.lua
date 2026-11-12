package = {
    spec = "1",

    name = "dsh-im",
    description = "通过扫码或机器人凭据把IM机器人接入DeepSeek Harness（支持飞书、微信、钉钉、企业微信、QQ、Telegram、Discord和WhatsApp）。 Connect IM bots to DeepSeek Harness via QR code or credentials (8 channels).",
    repo = "https://github.com/xmanrui/dsh-im",
    homepage = "https://github.com/xmanrui/dsh-im",
    licenses = {"MIT"},
    authors = {"xmanrui"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xmanrui/dsh-im",

        versions = {
            ["0.2.2"] = { commit = "bee4c2927faca1fb45eb552e664c1cbd7f5960a1" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
