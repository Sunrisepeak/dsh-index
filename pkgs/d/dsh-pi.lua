package = {
    spec = "1",

    name = "dsh-pi",
    description = "Run trusted Pi extensions inside DeepSeek Harness through a compatibility host.",
    repo = "https://github.com/TGYD-helige/dsh-pi",
    homepage = "https://github.com/TGYD-helige/dsh-pi",
    licenses = {"Apache-2.0"},
    authors = {"TGYD-helige"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-pi-host",

        versions = {
            ["0.1.0-rc.2"] = { commit = "c1ec106b5ff845c0ca53874bc1e2fc67795f6143" },
        },
        latest = "0.1.0-rc.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
