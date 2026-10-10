package = {
    spec = "1",

    name = "dsh-wechat",
    description = "WeChat channel for DeepSeek Harness",
    repo = "https://github.com/xcisxc29/dsh-wechat",
    homepage = "https://github.com/xcisxc29/dsh-wechat",
    licenses = {"MIT"},
    authors = {"xcisxc29"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-wechat-workspace",

        versions = {
            ["0.0.0"] = { commit = "5f7d69a8f83faad5a1154aec23aedb969c610931" },
        },
        latest = "0.0.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
