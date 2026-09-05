package = {
    spec = "1",

    name = "dsh-oil-creator",
    description = "AI-assisted local creator workbench for DeepSeek Harness",
    repo = "https://github.com/oil-oil/dsh-oil-creator",
    homepage = "https://github.com/oil-oil/dsh-oil-creator",
    licenses = {"MIT"},
    authors = {"oil-oil"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-oil-creator",

        versions = {
            ["0.1.0"] = { commit = "03f8d09ce9a298578ba850c0fc5dc3ff44b568ec" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
