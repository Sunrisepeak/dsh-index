package = {
    spec = "1",

    name = "dsh-plugin-pi-bridge",
    description = "Bridge pi skills and config into DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-pi-bridge",
    homepage = "https://github.com/YYTbit/dsh-plugin-pi-bridge",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin", "skills"},
    keywords = {"dsh", "pi"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-pi-bridge",

        versions = {
            ["0.1.1"] = { commit = "2bdf91d84274996e82052ffdbb8cf872429678ea" },
            ["0.1.0"] = { commit = "1604aaf6bde58b30bfbf32ec83fe548c01ec79d6" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-plugin-pi-bridge-0.1.0.tgz",
                sha256  = "751cc6567056a9f207784bc16e1c338bc2d91b7d3dca2e87abd648e4a87e8d53",
                cn      = true,
            },
        },
    },
}
