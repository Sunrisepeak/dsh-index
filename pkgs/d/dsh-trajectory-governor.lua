package = {
    spec = "1",

    name = "dsh-trajectory-governor",
    description = "Closed-loop trajectory policy plane for DeepSeek Harness",
    repo = "https://github.com/chunsi-w/dsh-trajectory-governor",
    homepage = "https://github.com/chunsi-w/dsh-trajectory-governor",
    licenses = {"MIT"},
    authors = {"chunsi-w"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@chunsi-m/dsh-trajectory-governor",

        versions = {
            ["0.2.0"] = { commit = "ce53de0e420dc06bcafecfa448ec71e580b9bbb0" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
