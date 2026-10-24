package = {
    spec = "1",

    name = "dsh-motion-ui",
    description = "Interactive UI, HTML/SVG diagrams and animation for DeepSeek Harness Web",
    repo = "https://github.com/Scorp1o117/dsh-motion-ui",
    homepage = "https://github.com/Scorp1o117/dsh-motion-ui",
    licenses = {"MIT"},
    authors = {"Scorp1o117"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-motion-ui",

        versions = {
            ["0.7.1"] = { commit = "3e03dcb926305a89ecb2c64f3ff1c4cc74cf3b61" },
        },
        latest = "0.7.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
