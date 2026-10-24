package = {
    spec = "1",

    name = "pi2dsh",
    description = "Bridge the Pi and DeepSeek Harness ecosystems: one Pi Host ABI runs unmodified Pi extensions as native DSH plugins. 打通 Pi 与 DSH 生态。",
    repo = "https://github.com/weijiafu14/pi2dsh",
    homepage = "https://github.com/weijiafu14/pi2dsh",
    licenses = {"MIT"},
    authors = {"weijiafu14"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "pi2dsh",

        versions = {
            ["0.12.1"] = { commit = "6d3ea1df5ae3ce99a5620cee02783a0686fb2161" },
        },
        latest = "0.12.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
