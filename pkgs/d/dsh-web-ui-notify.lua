package = {
    spec = "1",

    name = "dsh-web-ui-notify",
    description = "为 DSH 增加桌面通知提醒",
    repo = "https://github.com/bill9109/dsh-web-ui-notify",
    homepage = "https://github.com/bill9109/dsh-web-ui-notify",
    licenses = {"BSD-3-Clause"},
    authors = {"bill9109"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-web-ui-notify",
        source = "github",
        origin = "bill9109/dsh-web-ui-notify",

        versions = {
            ["0.1.2"] = { ref = "bd8eeb5c1a69df190fa10de253948e36e9679c44" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
