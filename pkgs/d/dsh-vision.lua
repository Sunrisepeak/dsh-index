package = {
    spec = "1",

    name = "dsh-vision",
    description = "Near-native image understanding for DeepSeek Harness",
    repo = "https://github.com/oil-oil/dsh-vision",
    homepage = "https://github.com/oil-oil/dsh-vision",
    licenses = {"MIT"},
    authors = {"oil-oil"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@oil-oil/dsh-vision",

        versions = {
            ["0.1.2"] = { commit = "9446a41dc96bd9fc96a7cc3b3a11365e125c9bd7" },
            ["0.1.0"] = { commit = "a12800eeb02eb6dd45f5e2cda6c7db3c16088883" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
