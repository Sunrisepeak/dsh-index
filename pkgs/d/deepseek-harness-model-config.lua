package = {
    spec = "1",

    name = "deepseek-harness-model-config",
    description = "deepseek-harness-model-config",
    repo = "https://github.com/MarvekG/deepseek-harness-model-config",
    homepage = "https://github.com/MarvekG/deepseek-harness-model-config",
    licenses = {"MIT"},
    authors = {"MarvekG"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-models-config-plugin",

        versions = {
            ["0.1.0"] = { commit = "a703fb8232e11034fff921e9b01d0bae86c304c2" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
