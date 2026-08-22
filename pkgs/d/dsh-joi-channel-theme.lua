package = {
    spec = "1",

    name = "dsh-joi-channel-theme",
    description = "轴伊 Joi 双衣装主题 for DeepSeek Harness — unofficial, non-commercial fan theme plugin 🍊",
    repo = "https://github.com/tpmoonchefryan/dsh-joi-channel-theme",
    homepage = "https://github.com/tpmoonchefryan/dsh-joi-channel-theme",
    licenses = {"MIT"},
    authors = {"tpmoonchefryan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-joi-channel-theme",

        versions = {
            ["0.1.10"] = { commit = "3c12a2706759104a94b51013d19bb3e9c3f2bef1" },
        },
        latest = "0.1.10",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
