package = {
    spec = "1",

    name = "citeguard",
    description = "Citation extraction and evidence verification for DeepSeek Harness.",
    repo = "https://github.com/Chhlafiu4312/citeguard",
    homepage = "https://github.com/Chhlafiu4312/citeguard",
    licenses = {"BSD-3-Clause"},
    authors = {"Chhlafiu4312"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-citeguard",

        versions = {
            ["0.1.7"] = { commit = "80cd36ef1afbbf18693d7adbdb8326aaeabac830" },
        },
        latest = "0.1.7",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
