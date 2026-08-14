package = {
    spec = "1",

    name = "dsh-dashboard",
    description = "Symphony-compatible Linear issue orchestrator and native operations dashboard for DeepSeek Harness.",
    repo = "https://github.com/Uddoo/dsh-dashboard",
    homepage = "https://github.com/Uddoo/dsh-dashboard",
    licenses = {"MIT"},
    authors = {"Uddoo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-dashboard",

        versions = {
            ["0.5.0"] = { commit = "6496a2c6646cb2d7fe3fab19ef34fd4692a8e4ae" },
        },
        latest = "0.5.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
