package = {
    spec = "1",

    name = "dsh-plugin-codex-bridge",
    description = "Bridge codex skills and config into DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-codex-bridge",
    homepage = "https://github.com/YYTbit/dsh-plugin-codex-bridge",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin", "skills", "provider"},
    keywords = {"dsh", "codex"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-codex-bridge",

        versions = {
            ["0.1.1"] = { commit = "90233786ec460b41e2b4b96cb6fd9bd4099ee943" },
            ["0.1.0"] = { commit = "949f31ad7f0fee0ff06831cf67e3385e3a923eb0" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-plugin-codex-bridge-0.1.0.tgz",
                sha256  = "cbbc921530a381d7687fd57d4b1a62241e356e3abd8dea20410249de1851635a",
                cn      = true,
            },
        },
    },
}
