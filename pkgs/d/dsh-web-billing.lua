package = {
    spec = "1",

    name = "dsh-web-billing",
    description = "RMB/USD token-billing plugin for DeepSeek Harness (dsh web): official-policy auto pricing with peak/off-peak hours, per-message ledger, account balance, locale-driven currency display. 人民币/美元 token 计费插件",
    repo = "https://github.com/bpc-oss/dsh-web-billing",
    homepage = "https://github.com/bpc-oss/dsh-web-billing",
    licenses = {"MIT"},
    authors = {"bpc-oss"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-billing",

        versions = {
            ["2.3.1"] = { commit = "d15518501d7902794d4b8600b2d09a4ee701fb61" },
        },
        latest = "2.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
