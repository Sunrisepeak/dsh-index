package = {
    spec = "1",

    name = "dsh-smarthome",
    description = "Home Assistant control for DeepSeek Harness agents — approval-gated lights, switches, climate.                                     给 DeepSeek Harness agent 的 Home Assistant 控制插件，一键接入智能家居，一键接入智能生活。",
    repo = "https://github.com/YLifeOnlyOnce/dsh-smarthome",
    homepage = "https://github.com/YLifeOnlyOnce/dsh-smarthome",
    licenses = {"MIT"},
    authors = {"YLifeOnlyOnce"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-smarthome",

        versions = {
            ["1.3.0"] = { commit = "05387a908329c644b5efbcb623dcf9391dd584d7" },
        },
        latest = "1.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
