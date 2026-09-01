package = {
    spec = "1",

    name = "dsh-notification",
    description = "Desktop notifications for DeepSeek Harness turn completions, with per-outcome controls and include/exclude key",
    repo = "https://github.com/omdsh-dev/dsh-notification",
    homepage = "https://github.com/omdsh-dev/dsh-notification",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "desktop", "notify"},
    keywords = {"dsh", "notification"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-notification",

        versions = {
            ["0.1.4"] = { commit = "675aab9b43d5011738feb6185281596c0365ccba" },
            ["0.1.3"] = { commit = "ddec603395a223deb46c75b74274c41849c6a131" },
            ["0.1.2"] = { commit = "2399457a1f96ed86f761f3bc771539d131eb684f" },
            ["0.1.1"] = { commit = "3e33100f51f25f24cece20bfd3d50cfbde0cbca5" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.1"] = {
                tarball = "dsh-notification-0.1.1.tgz",
                sha256  = "f3b32de9bdbfa40645c57e0af1495c133cace256064f9b4f528d8eff52b0cf07",
                cn      = true,
            },
        },
    },
}
