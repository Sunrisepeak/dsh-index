package = {
    spec = "1",

    name = "dsh-deepseek-vision",
    description = "Image understanding, OCR, and persistent visual evidence for text-only DeepSeek Harness models",
    repo = "https://github.com/Argonaut790/dsh-deepseek-vision",
    homepage = "https://github.com/Argonaut790/dsh-deepseek-vision",
    licenses = {"MIT"},
    authors = {"Argonaut790"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deepseek-vision",

        versions = {
            ["0.1.0"] = { commit = "0b1cc4ef7cbce4cf6aac2d85850e555ec0583b6d" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
