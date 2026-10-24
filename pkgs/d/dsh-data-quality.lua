package = {
    spec = "1",

    name = "dsh-data-quality",
    description = "DeepSeek Harness plugin: deterministic data profiling, cleaning, and verification (dsh-data-quality)",
    repo = "https://github.com/PerryLink/dsh-data-quality",
    homepage = "https://github.com/PerryLink/dsh-data-quality",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-data-quality",

        versions = {
            ["0.3.6"] = { commit = "7590d150f656736ef4cf88633892c546a3f50124" },
        },
        latest = "0.3.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
