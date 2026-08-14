package = {
    spec = "1",

    name = "dsh-plugin-visual-composer",
    description = "Visual Cordis plugin-tree composer for the DeepSeek Harness Web UI.",
    repo = "https://github.com/VanillaCreamer/dsh-plugin-visual-composer",
    homepage = "https://github.com/VanillaCreamer/dsh-plugin-visual-composer",
    licenses = {"MIT"},
    authors = {"VanillaCreamer"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-visual-composer",

        versions = {
            ["0.1.0"] = { commit = "78ce825c5f5da264c709c4979b70654b1a3dac7d" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
