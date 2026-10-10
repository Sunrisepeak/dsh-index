package = {
    spec = "1",

    name = "open-sea-skin",
    description = "WebGPU ocean skin for DeepSeek Harness — DSH plugin, Harness-only Chrome/Edge extension, static installer, and native integration.",
    repo = "https://github.com/d-dev0101/open-sea-skin",
    homepage = "https://github.com/d-dev0101/open-sea-skin",
    licenses = {"MIT"},
    authors = {"d-dev0101"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "open-sea-skin",

        versions = {
            ["1.2.1"] = { commit = "2437d80a96de4124c54fbe89872fa7090103f025" },
        },
        latest = "1.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
