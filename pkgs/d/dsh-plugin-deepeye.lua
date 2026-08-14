package = {
    spec = "1",

    name = "dsh-plugin-deepeye",
    description = "DeepEye vision plugin for DeepSeek Harness (DSH): image description, OCR, VQA, UI layout, and clipboard analysis.",
    repo = "https://github.com/Favio8/dsh-plugin-deepeye",
    homepage = "https://github.com/Favio8/dsh-plugin-deepeye",
    authors = {"Favio8"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-deepeye",

        versions = {
            ["0.1.1"] = { commit = "895ab8e3c90ccd45f5d6e070cb123c9860773e3f" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
