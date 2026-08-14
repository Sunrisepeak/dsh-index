package = {
    spec = "1",

    name = "dsh-usage-cost",
    description = "DSH plugin: per-step timestamped DeepSeek API usage timeline + peak/off-peak cost readout. Official bundle; install via: dsh plugin --profile web add github:Dino6021/dsh-usage-cost#main",
    repo = "https://github.com/Dino6021/dsh-usage-cost",
    homepage = "https://github.com/Dino6021/dsh-usage-cost",
    licenses = {"MIT"},
    authors = {"Dino6021"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-usage-cost",

        versions = {
            ["0.1.0"] = { commit = "3bf331e6974cf4f9d4a2aa963152196baab5f044" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
