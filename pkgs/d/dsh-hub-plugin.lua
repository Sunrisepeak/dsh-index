package = {
    spec = "1",

    name = "dsh-hub-plugin",
    description = "Native DSH Hub marketplace plugin for DeepSeek Harness",
    repo = "https://github.com/sliverp/dsh-hub-plugin",
    homepage = "https://github.com/sliverp/dsh-hub-plugin",
    authors = {"sliverp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-hub",

        versions = {
            ["0.2.0"] = { commit = "2b21934040c167e6fb08959b66bea2767f6a1b63" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
