package = {
    spec = "1",

    name = "dsh-web-ui-notify",
    description = "为 DSH 增加桌面通知提醒",
    repo = "https://github.com/bill9109/dsh-web-ui-notify",
    homepage = "https://github.com/bill9109/dsh-web-ui-notify",
    licenses = {"BSD-3-Clause"},
    authors = {"bill9109"},

    status = "dev",
    categories = {"dsh-plugin", "desktop", "web-ui"},
    keywords = {"dsh", "web", "notify"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-web-ui-notify",

        versions = {
            ["0.1.3"] = { commit = "865d2f6fc93f2e0d051d53df772646cb831a43ed" },
            ["0.1.2"] = { commit = "bd8eeb5c1a69df190fa10de253948e36e9679c44" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
