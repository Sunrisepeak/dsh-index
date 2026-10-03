package = {
    spec = "1",

    name = "dsh-opencode-go",
    description = "让你的DSH完美适配opencodeg-go套餐",
    repo = "https://github.com/Duskriver/dsh-opencode-go",
    homepage = "https://github.com/Duskriver/dsh-opencode-go",
    licenses = {"MIT"},
    authors = {"Duskriver"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-opencode-go",

        versions = {
            ["0.1.4"] = { commit = "8b165b62eab245fd6508187e70ac7f193e0a7cbd" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
