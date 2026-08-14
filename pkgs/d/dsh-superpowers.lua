package = {
    spec = "1",

    name = "dsh-superpowers",
    description = "Superpowers (obra/superpowers) as a DeepSeek Harness plugin: the methodology skills plus their session bootstrap",
    repo = "https://github.com/codeAnqiang-ma/dsh-superpowers",
    homepage = "https://github.com/codeAnqiang-ma/dsh-superpowers",
    authors = {"codeAnqiang-ma"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-superpowers",

        versions = {
            ["0.1.0"] = { commit = "9511c7b961faafb35f31e6b0e297524bf377aeaf" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
