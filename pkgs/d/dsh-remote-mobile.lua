package = {
    spec = "1",

    name = "dsh-remote-mobile",
    description = "DeepSeek Harness 远程与移动端安全网关插件：零修改 DSH 底层代码安全开放局域网与 Tailscale 连接 | DeepSeek Harness (DSH) Remote & Mobile Security Guard: safely opens Tailscale/LAN with zero core modifications, QR scan auth, RSA encryption & brute-force defense.",
    repo = "https://github.com/IceApriler/dsh-remote-mobile",
    homepage = "https://github.com/IceApriler/dsh-remote-mobile",
    licenses = {"MIT"},
    authors = {"IceApriler"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-remote-mobile",

        versions = {
            ["1.6.0"] = { commit = "4d801c0b47046e260565f4b2c10b6b4eb59a8c61" },
        },
        latest = "1.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
