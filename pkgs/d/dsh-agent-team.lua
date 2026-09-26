package = {
    spec = "1",

    name = "dsh-agent-team",
    description = "Give DeepSeek Harness a persistent agent team for long-running collaboration",
    repo = "https://github.com/wowyuarm/dsh-agent-team",
    homepage = "https://github.com/wowyuarm/dsh-agent-team",
    licenses = {"MIT"},
    authors = {"wowyuarm"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@wowyuarm/dsh-agent-team",

        versions = {
            ["0.1.8"] = { commit = "6782fa26988a0377d7bed4f5eeddc3d884528268" },
        },
        latest = "0.1.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
