package = {
    spec = "1",

    name = "dsh-agy",
    description = "Google Antigravity (agy) OAuth auth + model access plugin for DeepSeek Harness: multi-account pool, 429 rotation, device fingerprinting, CLI and web login.",
    repo = "https://github.com/chaos-03x/dsh-agy",
    homepage = "https://github.com/chaos-03x/dsh-agy",
    licenses = {"MIT"},
    authors = {"chaos-03x"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agy",

        versions = {
            ["0.1.1"] = { commit = "1da4ff09658a16e2aba48d993f3777be13a896e2" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
