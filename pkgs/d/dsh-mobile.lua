package = {
    spec = "1",

    name = "dsh-mobile",
    description = "DeepSeek Harness 移动端适配与安全局域网访问插件，支持 Android App 和手机浏览器。",
    repo = "https://github.com/saya-ch/dsh-mobile",
    homepage = "https://github.com/saya-ch/dsh-mobile",
    licenses = {"Apache-2.0"},
    authors = {"saya-ch"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mobile",

        versions = {
            ["0.1.0-alpha.26"] = { commit = "67b66208a8531b29f47fd15f5fa98f49dfaea9d2" },
        },
        latest = "0.1.0-alpha.26",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
