package = {
    spec = "1",

    name = "dsh-feishu",
    description = "通过扫码把飞书机器人接入DeepSeek Harness",
    repo = "https://github.com/xmanrui/dsh-feishu",
    homepage = "https://github.com/xmanrui/dsh-feishu",
    licenses = {"MIT"},
    authors = {"xmanrui"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xmanrui/dsh-feishu",

        versions = {
            ["0.1.0"] = { commit = "aad650feabadd511241aa58b236d64273d5e397f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
