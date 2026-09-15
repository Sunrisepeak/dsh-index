package = {
    spec = "1",

    name = "dsh-minecraft-ui",
    description = "deepseek harness  Minecraft UI",
    repo = "https://github.com/TFboy1/dsh-minecraft-ui",
    homepage = "https://github.com/TFboy1/dsh-minecraft-ui",
    licenses = {"MIT"},
    authors = {"TFboy1"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-minecraft-ui",

        versions = {
            ["0.3.0"] = { commit = "ec5313b87f8688b82421f124cc2f3887c84b3a8c" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
