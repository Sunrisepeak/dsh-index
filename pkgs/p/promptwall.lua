package = {
    spec = "1",

    name = "promptwall",
    description = "Local prompt-injection and secret-exfiltration firewall for DeepSeek Harness.",
    repo = "https://github.com/Chhlafiu4312/promptwall",
    homepage = "https://github.com/Chhlafiu4312/promptwall",
    licenses = {"BSD-3-Clause"},
    authors = {"Chhlafiu4312"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-promptwall",

        versions = {
            ["0.1.6"] = { commit = "a6f114c782f006933d94b8bcce85fd3c6903a347" },
        },
        latest = "0.1.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
